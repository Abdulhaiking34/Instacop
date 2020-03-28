import 'package:flutter/material.dart';
import 'package:instacop/src/helpers/colors_constant.dart';
import 'package:instacop/src/helpers/screen.dart';
import 'package:instacop/src/widgets/button_raised.dart';
import 'package:instacop/src/widgets/input_text.dart';

class SignInView extends StatefulWidget {
  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  bool isAdmin = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        //TODO: Username
        InputText(
          title: 'Email',
          onValueChange: (value) {},
        ),
        SizedBox(
          height: ConstScreen.setSizeHeight(18),
        ),
        //TODO: Password
        InputText(
          title: 'Password',
          isPassword: true,
          onValueChange: (value) {},
        ),
        //TODO: Button Sign In
        SizedBox(
          height: ConstScreen.setSizeHeight(20),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            //TODO: Admin
            Expanded(
              child: MaterialButton(
                height: ConstScreen.setSizeHeight(90),
                color: isAdmin ? kColorBlack : kColorWhite,
                child: Text(
                  'MANAGER',
                  style: TextStyle(
                      color: isAdmin ? kColorWhite : kColorBlack,
                      fontSize: FontSize.s30),
                ),
                onPressed: () {
                  setState(() {
                    isAdmin = true;
                  });
                },
              ),
            ),
            //TODO: Customer
            Expanded(
              child: MaterialButton(
                height: ConstScreen.setSizeHeight(90),
                color: isAdmin ? kColorWhite : kColorBlack,
                child: Text(
                  'CUSTOMER',
                  style: TextStyle(
                      color: isAdmin ? kColorBlack : kColorWhite,
                      fontSize: FontSize.s30),
                ),
                onPressed: () {
                  setState(() {
                    isAdmin = false;
                  });
                },
              ),
            ),
          ],
        ),

        SizedBox(
          height: ConstScreen.setSizeHeight(25),
        ),
        CusRaisedButton(
          backgroundColor: kColorBlack,
          title: 'SIGN IN',
          onPress: () {},
        )
      ],
    );
  }
}
