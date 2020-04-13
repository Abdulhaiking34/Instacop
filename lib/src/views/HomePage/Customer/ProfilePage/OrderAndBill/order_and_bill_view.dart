import 'package:flutter/material.dart';
import 'package:instacop/src/helpers/TextStyle.dart';
import 'package:instacop/src/helpers/colors_constant.dart';
import 'package:instacop/src/helpers/screen.dart';
import 'package:instacop/src/widgets/card_order.dart';

class OrderAndBillView extends StatefulWidget {
  OrderAndBillView({this.title});
  final String title;
  @override
  _OrderAndBillViewState createState() => _OrderAndBillViewState();
}

class _OrderAndBillViewState extends State<OrderAndBillView> {
  @override
  Widget build(BuildContext context) {
    ConstScreen.setScreen(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.title,
          style: kBoldTextStyle.copyWith(
            fontSize: FontSize.setTextSize(32),
          ),
        ),
        backgroundColor: kColorWhite,
        iconTheme: IconThemeData.fallback(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ConstScreen.setSizeWidth(20),
            vertical: ConstScreen.setSizeHeight(20)),
        child: ListView(
          children: <Widget>[
            OrderCard(
              id: 1,
              date: '12/2/2018',
              customerName: 'Nguyen Thieu Phuong Nam',
              status: 'Processing',
              total: '1,500,000',
              onViewDetail: () {
                Navigator.pushNamed(context, 'customer_order_info_screen');
              },
            ),
            OrderCard(
              id: 1,
              date: '2/2/2020',
              customerName: 'John Solo',
              status: 'Cancel',
              total: '500,000',
              isEnableCancel: false,
            )
          ],
        ),
      ),
    );
  }
}
