import 'package:flutter/material.dart';
import 'package:instacop/src/widgets/input_text.dart';

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InputText(
          title: 'Your name',
          onValueChange: (value) {},
        ),
        SizedBox(
          height: 10,
        ),
        //TODO: Email
        InputText(
          title: 'Email',
          onValueChange: (value) {},
        ),
        SizedBox(
          height: 10,
        ),
        //TODO: Password
        InputText(
          title: 'Password',
          isPassword: true,
          onValueChange: (value) {},
        ),
        SizedBox(
          height: 10,
        ),
        //TODO: Confirm Password
        InputText(
          title: 'Confirm',
          isPassword: true,
          onValueChange: (value) {},
        ),
      ],
    );
  }
}
