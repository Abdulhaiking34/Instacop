import 'package:flutter/material.dart';
import 'package:instacop/src/helpers/colors_constant.dart';
import 'package:instacop/src/helpers/screen.dart';
import 'package:instacop/src/views/Register/SignUp/sign_up_controller.dart';
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
  SignUpController signUpController = new SignUpController();

  String _fullName = '';
  String _email = '';
  String _password = '';
  String _confirmPwd = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        // TODO: Full Name
        StreamBuilder(
          stream: signUpController.fullNameStream,
          builder: (context, snapshot) => InputText(
            title: 'Full Name',
            errorText: snapshot.hasError ? snapshot.error : '',
            onValueChange: (value) {
              _fullName = value;
            },
          ),
        ),
        SizedBox(
          height: ConstScreen.setSizeHeight(18),
        ),
        //TODO: Birthday and Gender picker
//        Row(
//          children: <Widget>[
//            //TODO: Birthday
//            Expanded(
//              flex: 6,
//              child: //TODO: Date Picker
//                  GestureDetector(
//                onTap: () {
//                  DatePicker.showDatePicker(context,
//                      showTitleActions: true,
//                      minTime: DateTime(1950, 12, 31),
//                      maxTime: DateTime(DateTime.now().year, 12, 31),
//                      onChanged: (date) {
//                    print('change $date');
//                    _birthDay = date;
//                  }, onConfirm: (date) {
//                    print('confirm $date');
//                    _birthDay = date;
//                    setState(() {
//                      _isBirthdayConfirm = true;
//                    });
//                  }, currentTime: DateTime.now(), locale: LocaleType.vi);
//                },
//                child: Container(
//                  height: ConstScreen.setSizeHeight(100),
//                  decoration: BoxDecoration(
//                      border: Border.all(color: kColorBlack.withOpacity(0.7))),
//                  child: Center(
//                    child: Text(
//                      _isBirthdayConfirm
//                          ? ('Birthday: ' +
//                              _birthDay.day.toString() +
//                              '/' +
//                              _birthDay.month.toString() +
//                              '/' +
//                              _birthDay.year.toString())
//                          : 'Birthday Picker',
//                      style: TextStyle(
//                          color: kColorBlack,
//                          fontSize: FontSize.s30,
//                          fontWeight: FontWeight.w400),
//                    ),
//                  ),
//                ),
//              ),
//            ),
//            SizedBox(
//              width: ConstScreen.setSizeHeight(10),
//            ),
//            Expanded(
//              flex: 4,
//              //TODO: Gender
//              child: Container(
//                height: ConstScreen.setSizeHeight(100),
//                decoration:
//                    BoxDecoration(border: Border.all(color: Colors.black54)),
//                child: Padding(
//                  padding: EdgeInsets.only(
//                    top: ConstScreen.setSizeHeight(6),
//                    bottom: ConstScreen.setSizeHeight(6),
//                    left: ConstScreen.setSizeHeight(6),
//                  ),
//                  child: Center(
//                    child: DropdownButton(
//                      isExpanded: true,
//                      hint: AutoSizeText(
//                        genderData,
//                        style: kBoldTextStyle.copyWith(fontSize: FontSize.s30),
//                        minFontSize: 10,
//                        maxLines: 1,
//                      ),
//                      onChanged: (value) {
//                        setState(() {
//                          genderData = value;
//                        });
//                      },
//                      items: gender.map((String value) {
//                        return DropdownMenuItem(
//                            value: value,
//                            child: Text(
//                              value,
//                              style: kBoldTextStyle.copyWith(
//                                  fontSize: FontSize.s30),
//                            ));
//                      }).toList(),
//                    ),
//                  ),
//                ),
//              ),
//            ),
//          ],
//        ),
//        SizedBox(
//          height: ConstScreen.setSizeHeight(18),
//        ),
        //TODO: Email
        //TODO: Email
        StreamBuilder(
          stream: signUpController.emailStream,
          builder: (context, snapshot) => InputText(
            title: 'Email',
            errorText: snapshot.hasError ? snapshot.error : '',
            onValueChange: (value) {
              _email = value;
            },
          ),
        ),
        SizedBox(
          height: ConstScreen.setSizeHeight(18),
        ),
        //TODO: Password
        StreamBuilder(
          stream: signUpController.passwordStream,
          builder: (context, snapshot) => InputText(
            title: 'Password',
            errorText: snapshot.hasError ? snapshot.error : '',
            isPassword: true,
            onValueChange: (value) {
              _password = value;
            },
          ),
        ),
        SizedBox(
          height: ConstScreen.setSizeHeight(18),
        ),
        //TODO: Confirm Password
        StreamBuilder(
          stream: signUpController.confirmPwdSteam,
          builder: (context, snapshot) => InputText(
            title: 'Confirm',
            errorText: snapshot.hasError ? snapshot.error : '',
            isPassword: true,
            onValueChange: (value) {
              _confirmPwd = value;
            },
          ),
        ),
        SizedBox(
          height: ConstScreen.setSizeHeight(25),
        ),
        CusRaisedButton(
          backgroundColor: kColorBlack,
          title: 'REGISTER',
          onPress: () async {
            bool result = await signUpController.onSubmitRegister(
                fullName: _fullName,
                email: _email,
                password: _password,
                confirmPwd: _confirmPwd);

            if (result) {
              Navigator.pushNamed(context, 'customer_home_screen');
              signUpController.dispose();
            }
          },
        ),
      ],
    );
  }
}
