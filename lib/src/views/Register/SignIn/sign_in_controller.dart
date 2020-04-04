import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:instacop/src/helpers/validator.dart';

class SignInController {
  StreamController _isEmail = new StreamController();
  StreamController _isPassword = new StreamController();

  Stream get emailStream => _isEmail.stream;
  Stream get passwordStream => _isPassword.stream;

  Validators validators = new Validators();

  onSubmitSignIn({
    @required String email,
    @required String password,
    @required bool isAdmin,
  }) async {
    int countError = 0;
    _isEmail.sink.add('Ok');
    _isPassword.sink.add('Ok');

    if (!validators.isValidEmail(email)) {
      _isEmail.sink.addError('Invalid email address.');
      countError++;
    }

    if (!validators.isPassword(password)) {
      _isPassword.addError('Invaid password.');
      countError++;
    }

    //TODO: Sign in function
    if (countError == 0) {
      if (isAdmin) {
        //TODO: Admin Sign In
      } else {
        //TODO: Customer Sign In
      }
    }
  }

  void dispose() {
    _isEmail.close();
    _isPassword.close();
  }
}
