import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instacop/src/helpers/colors_constant.dart';
import 'package:instacop/src/widgets/button_raised.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        //TODO: Detail
        CusRaisedButton(
          title: 'Detail',
          backgroundColor: kColorWhite,
          height: 100,
          onPress: () {},
        ),
        //TODO: Change password
        CusRaisedButton(
          title: 'Change Password',
          backgroundColor: kColorWhite,
          height: 100,
          onPress: () {
            Navigator.pushNamed(context, 'customer_change_password_screen');
          },
        ),
        //TODO: Order and bill
        CusRaisedButton(
          title: 'Orders & Bill',
          backgroundColor: kColorWhite,
          height: 100,
          onPress: () {},
        ),
        //TODO: Bank Account
        CusRaisedButton(
          title: 'Bank Account',
          backgroundColor: kColorWhite,
          height: 100,
          onPress: () {},
        ),
        // TODO: Sign Out
        CusRaisedButton(
          title: 'Sign out',
          backgroundColor: kColorBlack,
          height: 100,
          onPress: () {
            Navigator.pushNamed(context, 'welcome_screen');
          },
        ),
      ],
    );
  }
}
