import 'dart:async';

import 'package:flutter/material.dart';
import 'package:instacop/src/helpers/validator.dart';

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
      _addressStreamController.sink.addError(' is empty.');
      countError++;
    }
    // TODO: Do something
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
  }
}
