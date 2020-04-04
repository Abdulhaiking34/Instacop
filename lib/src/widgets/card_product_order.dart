import 'package:flutter/material.dart';
import 'package:instacop/src/helpers/colors_constant.dart';
import 'package:instacop/src/helpers/screen.dart';
import 'package:instacop/src/widgets/widget_title.dart';

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
