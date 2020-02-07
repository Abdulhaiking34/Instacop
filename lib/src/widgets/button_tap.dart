import 'package:flutter/material.dart';

class ButtonTap extends StatelessWidget {
  ButtonTap({this.text, this.isSelected, this.function});
  final text;
  final isSelected;
  final function;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: function,
      child: Container(
        height: 50,
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
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
