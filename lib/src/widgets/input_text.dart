import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Username',
        focusColor: Colors.black,
        labelStyle: TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
      ),
    );
  }
}
