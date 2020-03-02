import 'package:flutter/material.dart';
import 'package:instacop/src/helpers/screen.dart';

class ButtonTap extends StatelessWidget {
  ButtonTap({this.text, this.isSelected = false, this.function});
  final text;
  final isSelected;
  final function;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: function,
      child: Container(
        height: ConstScreen.setSize(85),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? Colors.white : null,
          border: isSelected ? null : Border.all(color: Colors.white),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.white,
              fontSize: FontSize.setTextSize(35),
              fontWeight: FontWeight.w800,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
