import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instacop/src/helpers/colors_constant.dart';
import 'package:instacop/src/helpers/screen.dart';
import 'package:instacop/src/views/register/sign_in_form.dart';
import 'package:instacop/src/views/register/sign_up_form.dart';
import 'package:instacop/src/widgets/button_raised.dart';
import 'package:instacop/src/widgets/icon_instacop.dart';

class RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool _isSignIn = true;
  @override
  Widget build(BuildContext context) {
    ConstScreen.setScreen(context);
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kColorBlack,
        ),
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
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: ConstScreen.setSize(65),
                        horizontal: ConstScreen.setSize(65)),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            _isSignIn ? 'Sign In' : 'Register',
                            style: TextStyle(
                                fontSize: FontSize.setTextSize(60),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          _isSignIn ? SignInView() : SignUpView(),
                          SizedBox(
                            height: 10,
                          ),
                          //TODO: Button Change SignIn <-> SignUp
                          CusRaisedButton(
                            backgroundColor: Colors.grey.shade100,
                            title: _isSignIn ? 'REGISTER' : 'SIGN IN',
                            onPress: () {
                              setState(() {
                                _isSignIn = !_isSignIn;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
