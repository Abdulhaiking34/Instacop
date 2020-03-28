import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instacop/src/helpers/TextStyle.dart';
import 'package:instacop/src/helpers/colors_constant.dart';
import 'package:instacop/src/helpers/screen.dart';

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
              name: 'Planel Bape x Supreme Planel Bape x Supreme ',
              price: '500,000',
              quantity: 1,
              subTotal: '500,000',
            ),
            ProductOrderDetail(
              name: 'Planel Bape x Supreme',
              price: '500,000',
              quantity: 1,
              subTotal: '500,000',
            ),
            ProductOrderDetail(
              name: 'Planel Bape x Supreme',
              price: '500,000',
              quantity: 1,
              subTotal: '500,000',
            ),
          ],
        ),
      ),
    );
  }
}

class ProductOrderDetail extends StatelessWidget {
  ProductOrderDetail({
    this.name = '',
    this.price = '',
    this.quantity = 0,
    this.subTotal = '',
  });

  final String name;
  final String price;
  final int quantity;
  final String subTotal;
  @override
  Widget build(BuildContext context) {
    ConstScreen.setScreen(context);
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: kColorBlack.withOpacity(0.2),
            width: ConstScreen.setSizeWidth(4),
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
            bottom: ConstScreen.setSizeHeight(15),
            left: ConstScreen.setSizeHeight(27)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // TODO: Product name
            TitleWidget(
              title: 'Product Name: ',
              content: name,
              isSpaceBetween: false,
            ),
            //TODO: Price
            TitleWidget(
              title: 'Price: ',
              content: '$price VND',
              isSpaceBetween: false,
            ),
            //TODO: Quantity
            TitleWidget(
              title: 'Quantity: ',
              content: quantity.toString(),
              isSpaceBetween: false,
            ),
            //TODO: SubTotal
            TitleWidget(
              title: 'SubTotal: ',
              content: '$subTotal VND',
              isSpaceBetween: false,
            ),
          ],
        ),
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  TitleWidget({this.title = '', this.content = '', this.isSpaceBetween = true});

  final String title;
  final String content;
  final bool isSpaceBetween;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: ConstScreen.setSizeHeight(10),
          horizontal: ConstScreen.setSizeWidth(25)),
      child: Row(
        mainAxisAlignment: isSpaceBetween
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.start,
        children: <Widget>[
          AutoSizeText(
            title,
            maxLines: 1,
            minFontSize: 10,
            style: kBoldTextStyle.copyWith(
                fontSize: FontSize.s30, color: kColorBlack.withOpacity(0.5)),
          ),
          AutoSizeText(
            content,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            minFontSize: 10,
            style: kBoldTextStyle.copyWith(
                fontSize: FontSize.s30, color: kColorBlack),
          ),
        ],
      ),
    );
  }
}
