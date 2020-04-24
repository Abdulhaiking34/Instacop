import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:intl/intl.dart';

class Util {
  static String intToMoneyType(int value) {
    var controller = MoneyMaskedTextController(
        initialValue: value.toDouble(),
        precision: 0,
        decimalSeparator: '',
        thousandSeparator: ',');
//    var controller = new MaskedTextController(
//        text: value.toString(), mask: '000,000,000,000');

    return controller.text;
  }

  static String convertDateToString(String dateTime) {
    DateTime value = new DateFormat("yyyy-MM-dd hh:mm:ss").parse(dateTime);
    var formatter = new DateFormat.yMd().add_jm();
    return formatter.format(value);
  }

  static String encodePassword(String password) {
    var bytes = utf8.encode(password);
    return sha512.convert(bytes).toString();
  }
}
