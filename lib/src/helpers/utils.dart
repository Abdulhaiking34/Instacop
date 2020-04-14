import 'package:flutter_masked_text/flutter_masked_text.dart';

class MoneyFormat {
  static String intToMoneyType(int value) {
    var controller =
        new MaskedTextController(text: '', mask: '000,000,000,000,000');
    controller.updateText('$value');
    return controller.text;
  }
}
