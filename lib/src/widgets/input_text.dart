import 'package:flutter/material.dart';
import 'package:instacop/src/helpers/TextStyle.dart';
import 'package:instacop/src/helpers/colors_constant.dart';
import 'package:instacop/src/helpers/screen.dart';

class InputText extends StatefulWidget {
  InputText(
      {this.errorText,
      @required this.title,
      this.isPassword = false,
      @required this.icon,
      this.onValueChange});
  final String errorText;
  final String title;
  final bool isPassword;
  final IconData icon;
  final Function onValueChange;
  @override
  _InputTextState createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  bool isShowPassword = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.isPassword) {
      isShowPassword = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    ConstScreen.setScreen(context);
    return TextField(
      decoration: InputDecoration(
        labelText: widget.title,
        focusColor: Colors.black,
        labelStyle: kValueTextStyle.copyWith(fontSize: FontSize.s30),
        errorText: widget.errorText,
        suffixIcon: widget.isPassword
            ? GestureDetector(
                child: Icon(isShowPassword
                    ? Icons.remove_red_eye
                    : Icons.visibility_off),
                onTap: () {
                  setState(() {
                    isShowPassword = !isShowPassword;
                  });
                },
              )
            : Icon(
                Icons.title,
                color: Colors.white,
              ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
              color: (widget.errorText != '') ? kColorBlack : kColorRed),
        ),
      ),
      obscureText: isShowPassword,
      onChanged: (value) {
        widget.onValueChange(value);
      },
    );
  }
}
