import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
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
  DateTime _birthDay;
  bool _isBirthdayConfirm = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        InputText(
          title: 'Full Name',
          onValueChange: (value) {},
        ),
        SizedBox(
          height: ConstScreen.setSizeHeight(18),
        ),
        //TODO: Birthday and Gender picker
        Row(
          children: <Widget>[
            //TODO: Birthday
            Expanded(
              flex: 6,
              child: //TODO: Date Picker
                  GestureDetector(
                onTap: () {
                  DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(1950, 12, 31),
                      maxTime: DateTime(DateTime.now().year, 12, 31),
                      onChanged: (date) {
                    print('change $date');
                    _birthDay = date;
                  }, onConfirm: (date) {
                    print('confirm $date');
                    _birthDay = date;
                    setState(() {
                      _isBirthdayConfirm = true;
                    });
                  }, currentTime: DateTime.now(), locale: LocaleType.vi);
                },
                child: Container(
                  height: ConstScreen.setSizeHeight(100),
                  decoration: BoxDecoration(
                      border: Border.all(color: kColorBlack.withOpacity(0.7))),
                  child: Center(
                    child: Text(
                      _isBirthdayConfirm
                          ? ('Birthday: ' +
                              _birthDay.day.toString() +
                              '/' +
                              _birthDay.month.toString() +
                              '/' +
                              _birthDay.year.toString())
                          : 'Birthday Picker',
                      style: TextStyle(
                          color: kColorBlack,
                          fontSize: FontSize.s30,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: ConstScreen.setSizeHeight(10),
            ),
            Expanded(
              flex: 4,
              //TODO: Gender
              child: Container(
                height: ConstScreen.setSizeHeight(100),
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
                      isExpanded: true,
                      hint: AutoSizeText(
                        genderData,
                        style: kBoldTextStyle.copyWith(fontSize: FontSize.s30),
                        minFontSize: 10,
                        maxLines: 1,
                      ),
                      onChanged: (value) {
                        setState(() {
                          genderData = value;
                        });
                      },
                      items: gender.map((String value) {
                        return DropdownMenuItem(
                            value: value,
                            child: Text(
                              value,
                              style: kBoldTextStyle.copyWith(
                                  fontSize: FontSize.s30),
                            ));
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
