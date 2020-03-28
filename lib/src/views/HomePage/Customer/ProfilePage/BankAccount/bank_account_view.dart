import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instacop/src/helpers/TextStyle.dart';
import 'package:instacop/src/helpers/colors_constant.dart';
import 'package:instacop/src/helpers/screen.dart';
import 'package:instacop/src/widgets/button_raised.dart';

class BankAccountView extends StatefulWidget {
  @override
  _BankAccountViewState createState() => _BankAccountViewState();
}

class _BankAccountViewState extends State<BankAccountView> {
  String cardNumber = '424242424242';
  String expiryDate = '12/8';
  String cardHolderName = 'John';
  String cvvCode = '1606';
  bool isCvvFocused = false;
  bool isHaveCard = true;
  @override
  Widget build(BuildContext context) {
    ConstScreen.setScreen(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isHaveCard ? 'My Bank Account' : 'Add Credit Card',
          style: kBoldTextStyle.copyWith(
            fontSize: FontSize.setTextSize(32),
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.edit),
            color: kColorBlack,
            iconSize: ConstScreen.setSizeWidth(35),
            onPressed: () {
              setState(() {
                isHaveCard = !isHaveCard;
                cardNumber = '';
                expiryDate = '';
                cardHolderName = '';
                cvvCode = '';
                isCvvFocused = false;
              });
            },
          )
        ],
        backgroundColor: kColorWhite,
        iconTheme: IconThemeData.fallback(),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: ConstScreen.setSizeHeight(20),
              horizontal: ConstScreen.setSizeHeight(30)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // TODO Card view
                Center(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isCvvFocused = !isCvvFocused;
                      });
                    },
                    child: CreditCardWidget(
                      height: ConstScreen.setSizeHeight(380),
                      width: ConstScreen.setSizeWidth(600),
                      textStyle: TextStyle(
                          fontSize: FontSize.setTextSize(34),
                          color: kColorWhite,
                          fontWeight: FontWeight.bold),
                      cardNumber: cardNumber,
                      expiryDate: expiryDate,
                      cardHolderName: cardHolderName,
                      cvvCode: cvvCode,
                      showBackView: isCvvFocused,
                    ),
                  ),
                ),
                //TODO: Card Data
                isHaveCard
                    ? Container()
                    : CreditCardForm(
                        themeColor: Colors.red,
                        onCreditCardModelChange: (CreditCardModel data) {
                          setState(() {
                            cardNumber = data.cardNumber;
                            expiryDate = data.expiryDate;
                            cardHolderName = data.cardHolderName;
                            cvvCode = data.cvvCode;
                            isCvvFocused = data.isCvvFocused;
                          });
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: isHaveCard
          ? null
          : // TODO: Add card Button
          Container(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: ConstScreen.setSizeHeight(20),
                    horizontal: ConstScreen.setSizeWidth(20)),
                child: CusRaisedButton(
                  title: 'ADD',
                  backgroundColor: kColorBlack,
                  onPress: () {},
                ),
              ),
            ),
    );
  }
}
