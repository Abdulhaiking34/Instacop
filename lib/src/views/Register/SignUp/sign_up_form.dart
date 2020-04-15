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

  bool _isRegisterLoading = true;
  SignUpController signUpController = new SignUpController();

  String _fullName = '';
  String _email = '';
  String _phone = '';
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
        //TODO: phone number
        StreamBuilder(
          stream: signUpController.phoneStream,
          builder: (context, snapshot) => InputText(
            title: 'Phone number',
            inputType: TextInputType.number,
            errorText: snapshot.hasError ? snapshot.error : '',
            onValueChange: (value) {
              _phone = value;
            },
          ),
        ),
        SizedBox(
          height: ConstScreen.setSizeHeight(18),
        ),
        //TODO: email
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
          isDisablePress: _isRegisterLoading,
          title: 'REGISTER',
          onPress: () async {
            bool result = await signUpController.onSubmitRegister(
                fullName: _fullName,
                phone: _phone,
                email: _email,
                password: _password,
                confirmPwd: _confirmPwd);

            if (result) {
              setState(() {
                _isRegisterLoading = false;
              });
              Navigator.pushNamed(context, 'customer_home_screen');

              signUpController.dispose();
            }
          },
        ),
      ],
    );
  }
}
