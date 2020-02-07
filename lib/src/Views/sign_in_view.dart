import 'package:flutter/material.dart';
import 'package:instacop/link.dart';
import 'package:instacop/src/widgets/icon_instacop.dart';
import 'package:instacop/src/widgets/input_text.dart';

class SignInView extends StatefulWidget {
  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.black,
              Colors.black87,
            ], begin: Alignment.topCenter),
          ),
          child: Column(
            children: <Widget>[
              new IconInstacop(
                textSize: 54,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
