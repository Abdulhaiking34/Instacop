import 'package:flutter/material.dart';
import 'package:instacop/src/helpers/TextStyle.dart';
import 'package:instacop/src/helpers/colors_constant.dart';
import 'package:instacop/src/helpers/screen.dart';
import 'package:instacop/src/widgets/button_raised.dart';
import 'package:instacop/src/widgets/input_text.dart';

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  List<String> gender = ['Male', 'Female'];
  String genderData = 'Choose Gender';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InputText(
          title: 'Full Name',
          onValueChange: (value) {},
        ),
        SizedBox(
          height: ConstScreen.setSizeHeight(18),
        ),
        Row(
          children: <Widget>[
            //TODO: Birthday
            Expanded(
              flex: 5,
              child: InputText(
                title: 'Birthday',
                onValueChange: (value) {},
              ),
            ),
            SizedBox(
              width: ConstScreen.setSizeHeight(20),
            ),
            Expanded(
              flex: 4,
              //TODO: Gender
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black54)),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: ConstScreen.setSizeHeight(6),
                    bottom: ConstScreen.setSizeHeight(6),
                    left: ConstScreen.setSizeHeight(6),
                  ),
                  child: Center(
                    child: DropdownButton(
                      hint: Text(
                        genderData,
                        style: kValueTextStyle.copyWith(fontSize: FontSize.s30),
                      ),
                      onChanged: (value) {
                        setState(() {
                          genderData = value;
                        });
                      },
                      items: gender.map((String value) {
                        return DropdownMenuItem(
                            value: value, child: Text(value));
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: ConstScreen.setSizeHeight(18),
        ),
        //TODO: Email
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
        SizedBox(
          height: ConstScreen.setSizeHeight(18),
        ),
        //TODO: Confirm Password
        InputText(
          title: 'Confirm',
          isPassword: true,
          onValueChange: (value) {},
        ),
        SizedBox(
          height: ConstScreen.setSizeHeight(25),
        ),
        CusRaisedButton(
          backgroundColor: kColorBlack,
          title: 'REGISTER',
          onPress: () {},
        ),
      ],
    );
  }
}
