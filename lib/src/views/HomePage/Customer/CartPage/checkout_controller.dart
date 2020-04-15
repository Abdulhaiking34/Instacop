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

  Stream get nameStream => _nameStreamController.stream;
  Stream get phoneStream => _phoneStreamController.stream;
  Stream get addressStream => _addressStreamController.stream;

  onPayment({
    @required String name,
    @required String phoneNumber,
    @required String address,
    @required List<Product> productList,
    @required String total,
  }) async {
    _nameStreamController.sink.add('');
    _phoneStreamController.sink.add('');
    _addressStreamController.sink.add('');
    int countError = 0;

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
    // TODO: Do something
    if (countError == 0) {
      try {
        String cusName = await StorageUtil.geFullName();
        String uid = await StorageUtil.getUid();
        String randomId = DateTime.now().millisecondsSinceEpoch.toString();
        //TODO: receiver info
        await Firestore.instance
            .collection('Orders')
            .document(randomId)
            .setData({
          'id': uid,
          'sub_Id': randomId,
          'customer_name': cusName,
          'receiver_name': name,
          'address': address,
          'total': total,
          'phone': phoneNumber,
          'status': 'Pending',
          'create_at': DateTime.now().toString()
        }).then((value) {
          //TODO: add list product
          for (var product in productList) {
            Firestore.instance
              ..collection('Orders')
                  .document(randomId)
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
    } else {
      return false;
    }
  }

  void dispose() {
    _nameStreamController.close();
    _phoneStreamController.close();
    _addressStreamController.close();
  }
}
