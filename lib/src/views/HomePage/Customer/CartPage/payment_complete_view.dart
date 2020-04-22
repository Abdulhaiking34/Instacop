import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:instacop/src/helpers/TextStyle.dart';
import 'package:instacop/src/helpers/colors_constant.dart';
import 'package:instacop/src/helpers/screen.dart';
import 'package:instacop/src/helpers/utils.dart';
import 'package:instacop/src/widgets/button_raised.dart';

class PaymentCompleteView extends StatefulWidget {
  PaymentCompleteView({this.totalPrice});
  final int totalPrice;
  @override
  _PaymentCompleteViewState createState() => _PaymentCompleteViewState();
}

class _PaymentCompleteViewState extends State<PaymentCompleteView> {
  @override
  Widget build(BuildContext context) {
    ConstScreen.setScreen(context);
    return Scaffold(
      backgroundColor: kColorWhite,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                flex: 3,
                child: Icon(
                  Icons.check_circle,
                  color: kColorGreen,
                  size: ConstScreen.setSizeHeight(250),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    Text(
                      Util.intToMoneyType(widget.totalPrice) + ' VND',
                      textAlign: TextAlign.center,
                      style: kNormalTextStyle.copyWith(
                          fontSize: FontSize.setTextSize(75)),
                    ),
                    Text(
                      'Your payment is complete.',
                      textAlign: TextAlign.center,
                      style: kNormalTextStyle.copyWith(
                          fontSize: FontSize.setTextSize(40)),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 4,
                      child: Container(),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: ConstScreen.setSizeWidth(30)),
                        child: CusRaisedButton(
                          title: 'CONTINUTE SHOPPING',
                          backgroundColor: kColorGreen,
                          onPress: () {
                            Navigator.pushNamedAndRemoveUntil(
                                context,
                                'customer_home_screen',
                                (Route<dynamic> route) => false);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
