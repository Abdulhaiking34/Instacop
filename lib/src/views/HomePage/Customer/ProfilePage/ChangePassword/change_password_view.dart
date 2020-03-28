import 'package:flutter/material.dart';
import 'package:instacop/src/helpers/TextStyle.dart';
import 'package:instacop/src/helpers/colors_constant.dart';
import 'package:instacop/src/helpers/screen.dart';
import 'package:instacop/src/widgets/button_raised.dart';
import 'package:instacop/src/widgets/input_text.dart';

class ChangePasswordView extends StatefulWidget {
  @override
  _ChangePasswordViewState createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  @override
  Widget build(BuildContext context) {
    ConstScreen.setScreen(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Change My Password',
          style: kBoldTextStyle.copyWith(
            fontSize: FontSize.setTextSize(32),
          ),
        ),
        backgroundColor: kColorWhite,
        iconTheme: IconThemeData.fallback(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: ConstScreen.setSizeWidth(40)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: ConstScreen.setSizeHeight(60),
            ),
            //TODO: Current password
            InputText(
              title: 'Current password',
              isPassword: true,
              onValueChange: () {},
            ),
            SizedBox(
              height: ConstScreen.setSizeHeight(13),
            ),
            //TODO: New password
            InputText(
              title: 'New password',
              isPassword: true,
              onValueChange: () {},
            ),
            SizedBox(
              height: ConstScreen.setSizeHeight(13),
            ),
            //TODO: Confirm new password
            InputText(
              title: 'Confirm new password',
              isPassword: true,
              onValueChange: () {},
            ),
            SizedBox(
              height: ConstScreen.setSizeHeight(20),
            ),
            //TODO: Change password Button
            CusRaisedButton(
              title: 'Save',
              backgroundColor: kColorBlack,
              onPress: () {},
            )
          ],
        ),
      ),
    );
  }
}
