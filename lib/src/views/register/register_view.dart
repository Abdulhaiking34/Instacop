import 'package:flutter/material.dart';
import 'package:instacop/src/helpers/colors_constant.dart';
import 'package:instacop/src/views/register/sign_in_view.dart';
import 'package:instacop/src/views/register/sign_up_view.dart';
import 'package:instacop/src/widgets/button_raised.dart';
import 'package:instacop/src/widgets/button_tap.dart';
import 'package:instacop/src/widgets/icon_instacop.dart';
import 'package:instacop/src/widgets/input_text.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:instacop/src/helpers/utils.dart' as Utils;

class RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool _isSignIn = true;

  FirebaseMessaging _firebaseMessaging = new FirebaseMessaging();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _firebaseMessaging.configure(
        onResume: (Map<String, dynamic> message) async {
      print('OnResume: $message');
    }, onMessage: (Map<String, dynamic> message) async {
      print('OnMessage: $message');
    }, onLaunch: (Map<String, dynamic> message) async {
      print('OnLauch: $message');
    });
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
  }

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
          child: Padding(
            padding: EdgeInsets.only(top: 100),
            child: Column(
              children: <Widget>[
                new IconInstacop(
                  textSize: 54,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 50, horizontal: 25),
                        child: Column(
                          children: <Widget>[
                            Text(
                              _isSignIn ? 'Sign In' : 'Register',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            _isSignIn ? SignInView() : SignUpView(),
                            SizedBox(
                              height: 10,
                            ),
                            //TODO: Button Sign In/Up
                            CusRaisedButton(
                              backgroundColor: kColorBlack,
                              title: _isSignIn ? 'SIGN IN' : 'REGISTER',
                              onPress: () {},
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            //TODO: Button Change SignIn <-> SignUp
                            CusRaisedButton(
                              backgroundColor: kColorWhite,
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
      ),
    );
  }
}
