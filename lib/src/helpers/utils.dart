import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:intl/intl.dart';

class Util {
  static String intToMoneyType(int value) {
    var controller =
        new MaskedTextController(text: '', mask: '000,000,000,000,000');
    controller.updateText('$value');
    return controller.text;
  }

  static String convertDateToString(String dateTime) {
    DateTime value = new DateFormat("yyyy-MM-dd hh:mm:ss").parse(dateTime);
    var formatter = new DateFormat.yMd().add_jm();
    return formatter.format(value);
  }
}
