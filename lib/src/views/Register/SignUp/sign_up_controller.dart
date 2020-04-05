import 'dart:async';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:instacop/src/helpers/shared_preferrence.dart';
import 'package:instacop/src/helpers/validator.dart';
import 'package:instacop/src/model/user.dart';

class SignUpController {
  StreamController _isFullNameController = new StreamController();
  StreamController _isEmailController = new StreamController();
  StreamController _isPasswordController = new StreamController();
  StreamController _isConfirmPwdController = new StreamController();

  Stream get fullNameStream => _isFullNameController.stream;
  Stream get emailStream => _isEmailController.stream;
  Stream get passwordStream => _isPasswordController.stream;
  Stream get confirmPwdSteam => _isConfirmPwdController.stream;

  Validators validators = new Validators();

  onSubmitRegister({
    @required String fullName,
    @required String email,
    @required String password,
    @required String confirmPwd,
  }) async {
    int countError = 0;
    _isFullNameController.sink.add('Ok');
    _isEmailController.sink.add('Ok');
    _isPasswordController.sink.add('Ok');
    _isConfirmPwdController.sink.add('Ok');

    if (fullName == '' || fullName == null) {
      _isFullNameController.sink.addError('Invalid full name.');
      countError++;
    }

    if (!validators.isValidEmail(email)) {
      _isEmailController.sink.addError('Invalid email address.');
      countError++;
    }

    if (!validators.isPassword(password)) {
      _isPasswordController.sink.addError('Invalid password.');
      countError++;
    }

    if (!validators.isPassword(confirmPwd)) {
      _isConfirmPwdController.sink.addError('Invalid confirm password.');
      countError++;
    }
    if (password != confirmPwd) {
      _isConfirmPwdController.sink
          .addError('Confirm passoword does not match.');
      countError++;
    }

    //TODO: Accept Sign Up
    if (countError == 0) {
      try {
        //TODO: Create account
        FirebaseAuth firebaseAuth = FirebaseAuth.instance;
        FirebaseUser user = (await firebaseAuth.createUserWithEmailAndPassword(
                email: email, password: password))
            .user;

        //TODO: Add data to database
        String createAt = user.metadata.creationTime.toString();
        //TODO: encode password
        var bytes = utf8.encode("foobar");
        String pwdSha512 = sha512.convert(bytes).toString();
        Firestore.instance.collection('Users').document(user.uid).setData({
          'username': email,
          'password': pwdSha512,
          'fullname': fullName,
          'gender': '',
          'birthday': '',
          'phone': '',
          'address': '',
          'create_at': createAt,
          'id_scripe': '',
          'type': 'customer',
        });
        User userInfo = new User(fullName, email, password, '', '', '', '',
            createAt, '', 'customer');
        StorageUtil.setUid(user.uid);
        StorageUtil.setFullName(fullName);
        await StorageUtil.setIsLogging(true);
        StorageUtil.setUserInfo(userInfo);
        StorageUtil.setAccountType('customer');
        return true;
      } catch (e) {
        _isEmailController.sink.addError('The email address is already in use');
      }
    }
  }

  void dispose() {
    _isFullNameController.close();
    _isEmailController.close();
    _isConfirmPwdController.close();
    _isPasswordController.close();
  }
}
