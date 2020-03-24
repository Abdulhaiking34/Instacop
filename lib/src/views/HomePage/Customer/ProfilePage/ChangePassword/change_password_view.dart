import 'package:flutter/material.dart';
import 'package:instacop/src/helpers/TextStyle.dart';
import 'package:instacop/src/helpers/colors_constant.dart';
import 'package:instacop/src/helpers/screen.dart';
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
        title: Text(
          'Change My Password',
          style: kValueTextStyle.copyWith(
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
            InputText(
              title: 'Current password',
              isPassword: true,
              errorText: 'invalid password',
              onValueChange: () {},
            ),
            SizedBox(
              height: ConstScreen.setSizeHeight(13),
            ),
            InputText(
              title: 'New password',
              isPassword: true,
              onValueChange: () {},
            ),
            SizedBox(
              height: ConstScreen.setSizeHeight(13),
            ),
            InputText(
              title: 'Comfirm new password',
              isPassword: true,
              onValueChange: () {},
            ),
          ],
        ),
      ),
    );
  }
}
