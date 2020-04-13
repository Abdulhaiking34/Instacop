import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instacop/src/helpers/TextStyle.dart';
import 'package:instacop/src/helpers/colors_constant.dart';
import 'package:instacop/src/helpers/screen.dart';
import 'package:instacop/src/widgets/card_product_order.dart';
import 'package:instacop/src/widgets/widget_title.dart';

class OrderInfoView extends StatefulWidget {
  @override
  _OrderInfoViewState createState() => _OrderInfoViewState();
}

class _OrderInfoViewState extends State<OrderInfoView> {
  @override
  Widget build(BuildContext context) {
    ConstScreen.setScreen(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Order Info',
          style: kBoldTextStyle.copyWith(
            fontSize: FontSize.setTextSize(32),
          ),
        ),
        backgroundColor: kColorWhite,
        iconTheme: IconThemeData.fallback(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: ConstScreen.setSizeHeight(25),
        ),
        child: ListView(
          children: <Widget>[
            //TODO: Main Info
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ConstScreen.setSizeWidth(25)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  //TODO: Order ID
                  TitleWidget(
                    title: 'Oder Id',
                    content: '1',
                  ),
                  TitleWidget(
                    title: 'Date',
                    content: '12/2/2018',
                  ),
                  TitleWidget(
                    title: 'Customer',
                    content: 'Nguyen Thieu Phuong Nam',
                  ),
                  TitleWidget(
                    title: 'Status',
                    content: 'Processing',
                  ),
                  TitleWidget(
                    title: 'Total',
                    content: '1,500,000 VND',
                  ),
                ],
              ),
            ),
            Container(
              color: kColorLightGrey,
              height: ConstScreen.setSizeHeight(70),
              child: Padding(
                padding: EdgeInsets.only(left: ConstScreen.setSizeWidth(30)),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: AutoSizeText(
                    'Product Detail',
                    maxLines: 1,
                    minFontSize: 10,
                    style: kBoldTextStyle.copyWith(
                        fontSize: FontSize.setTextSize(32), color: kColorBlue),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: ConstScreen.setSizeHeight(15),
            ),
            //TODO: List Product
            ProductOrderDetail(
              name: 'Planel Bape x Supreme Supreme Planel ',
              price: '500,000',
              quantity: 2,
              subTotal: '1,000,000',
            ),
            ProductOrderDetail(
              name: 'Planel Bape x Supreme',
              price: '500,000',
              quantity: 1,
              subTotal: '500,000',
            ),
            //TODO: Phone number
            Container(
              color: kColorLightGrey,
              height: ConstScreen.setSizeHeight(70),
              child: Padding(
                padding: EdgeInsets.only(left: ConstScreen.setSizeWidth(30)),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: AutoSizeText(
                    'Phone Number',
                    maxLines: 1,
                    minFontSize: 10,
                    style: kBoldTextStyle.copyWith(
                        fontSize: FontSize.setTextSize(32), color: kColorBlue),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: ConstScreen.setSizeHeight(10),
                  left: ConstScreen.setSizeHeight(27)),
              child: AutoSizeText(
                '0971882230',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                minFontSize: 10,
                style: kBoldTextStyle.copyWith(
                    fontSize: FontSize.s30, color: kColorBlack),
              ),
            ),
            //TODO: Shipping Address
            Container(
              color: kColorLightGrey,
              height: ConstScreen.setSizeHeight(70),
              child: Padding(
                padding: EdgeInsets.only(left: ConstScreen.setSizeWidth(30)),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: AutoSizeText(
                    'Shipping Address',
                    maxLines: 1,
                    minFontSize: 10,
                    style: kBoldTextStyle.copyWith(
                        fontSize: FontSize.setTextSize(32), color: kColorBlue),
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(
                  top: ConstScreen.setSizeHeight(10),
                  left: ConstScreen.setSizeHeight(27)),
              child: AutoSizeText(
                'Cai Dau, Chau Phu, An Giang',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                minFontSize: 10,
                style: kBoldTextStyle.copyWith(
                    fontSize: FontSize.s30, color: kColorBlack),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
