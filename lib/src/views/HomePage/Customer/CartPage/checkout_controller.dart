import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instacop/src/helpers/shared_preferrence.dart';
import 'package:instacop/src/helpers/validator.dart';
import 'package:instacop/src/model/product.dart';

class CheckoutController {
  StreamController _nameStreamController = new StreamController();
  StreamController _phoneStreamController = new StreamController();
  StreamController _addressStreamController = new StreamController();
  StreamController _quantityStreamController = new StreamController();
  StreamController _btnStreamController = new StreamController();

  Stream get nameStream => _nameStreamController.stream;
  Stream get phoneStream => _phoneStreamController.stream;
  Stream get addressStream => _addressStreamController.stream;
  Stream get quantityStream => _quantityStreamController.stream;
  Stream get btnLoadingStream => _btnStreamController.stream;

  onPayment({
    @required String name,
    @required String phoneNumber,
    @required String address,
    @required List<Product> productList,
    @required String total,
    @required String orderId,
    @required String clientSecret,
    @required String paymentMethodId,
  }) async {
//   TODO: Payment
    try {
      String cusName = await StorageUtil.geFullName();
      String uid = await StorageUtil.getUid();
      //TODO: receiver info
      await Firestore.instance.collection('Orders').document(orderId).setData({
        'id': uid,
        'sub_Id': orderId,
        'customer_name': cusName,
        'receiver_name': name,
        'address': address,
        'total': total,
        'phone': phoneNumber,
        'status': 'Pending',
        'client_secret': clientSecret,
        'payment_method_id': paymentMethodId,
        'create_at': DateTime.now().toString()
      }).then((value) {
        //TODO: add list product
        for (var product in productList) {
          Firestore.instance
            ..collection('Orders')
                .document(orderId)
                .collection(uid)
                .document(product.id)
                .setData({
              'id': product.id,
              'name': product.productName,
              'size': product.size,
              'color': product.color,
              'price': product.price,
              'quantity': product.quantity
            });
        }
      });
      Firestore.instance
          .collection('Carts')
          .document(uid)
          .collection(uid)
          .getDocuments()
          .then((snapshot) {
        for (DocumentSnapshot document in snapshot.documents) {
          document.reference.delete();
        }
      });
    } catch (err) {
      return false;
    }
    return true;
  }

  onValidate({
    @required String name,
    @required String phoneNumber,
    @required String address,
    @required List<Product> productList,
    @required String total,
  }) async {
    _btnStreamController.add(false);
    _nameStreamController.sink.add('');
    _phoneStreamController.sink.add('');
    _addressStreamController.sink.add('');
    _quantityStreamController.add('');
    int countError = 0;
    String message = 'Too much quantity selected: \n';

    if (name == null || name == '') {
      _nameStreamController.sink.addError('Receiver\'s name is empty.');
      countError++;
    }

    if (phoneNumber == null || phoneNumber == '') {
      _phoneStreamController.sink.addError('Phone number is empty.');
      countError++;
    }
    Validators validators = new Validators();
    bool isphone = validators.isPhoneNumber(phoneNumber);
    if (!isphone) {
      _phoneStreamController.sink.addError('Phone number is invalid.');
      countError++;
    }

    if (address == null || address == '') {
      _addressStreamController.sink.addError(' is invalid.');
      countError++;
    }

    //TODO: Check quantity maximum
    for (var product in productList) {
      await Firestore.instance
          .collection('Products')
          .document(product.id)
          .get()
          .then((document) {
        if (int.parse(product.quantity) > int.parse(product.quantityMain)) {
          countError++;
          message +=
              '+  ${product.quantity}/${product.quantityMain} quantity of  ${product.productName} product \n';
        }
      });
    }
    _btnStreamController.add(true);
    if (countError == 0) {
      return true;
    } else {
      return false;
    }
  }

  void dispose() {
    _nameStreamController.close();
    _phoneStreamController.close();
    _addressStreamController.close();
    _quantityStreamController.close();
  }
}
