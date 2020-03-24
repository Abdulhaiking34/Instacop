import 'package:flutter/material.dart';
import 'package:instacop/src/helpers/colors_constant.dart';
import 'package:instacop/src/helpers/screen.dart';

class CusRaisedButton extends StatefulWidget {
  CusRaisedButton({
    this.backgroundColor,
    @required this.title,
    this.onPress,
    this.width = 650,
    this.height = 80,
  });

  final Color backgroundColor;
  final String title;
  final Function onPress;
  final double width;
  final double height;

  @override
  _CusRaisedButtonState createState() => _CusRaisedButtonState();
}

class _CusRaisedButtonState extends State<CusRaisedButton> {
  @override
  Widget build(BuildContext context) {
    ConstScreen.setScreen(context);
    return MaterialButton(
      height: ConstScreen.setSizeHeight(widget.height),
      minWidth: ConstScreen.setSizeHeight(widget.width),
      color: widget.backgroundColor,
      child: Text(
        widget.title,
        style: TextStyle(
            fontSize: FontSize.s27,
            color: (widget.backgroundColor == kColorBlack)
                ? kColorWhite
                : kColorBlack),
      ),
      onPressed: () {
        widget.onPress();
      },
    );
  }
}
