import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:instacop/link.dart';
import 'package:instacop/src/helpers/colors_constant.dart';
import 'package:instacop/src/helpers/screen.dart';

class ProductCard extends StatelessWidget {
  ProductCard(
      {@required this.productName,
      @required this.price,
      @required this.image,
      this.salePrice = 0,
      this.onTap});

  final String productName;
  final String image;
  final int price;
  final int salePrice;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    var controller =
        new MaskedTextController(text: '', mask: '000,000,000,000');
    controller.updateText(price.toString());
    String priceText = controller.text;
    controller.updateText(salePrice.toString());
    String salePriceText = controller.text;
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Product Image
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(KImageAddress + image),
                      fit: BoxFit.fill)),
            ),
          ),
          SizedBox(
            height: ConstScreen.setSizeHeight(5),
          ),
          // Product Title
          Text(
            productName,
            style: TextStyle(
                fontSize: FontSize.s25,
                color: kColorBlack,
                fontWeight: FontWeight.w400),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                priceText + ' VND',
                style: TextStyle(
                    fontSize: FontSize.s23,
                    color: kColorBlack,
                    decoration: (salePrice != 0)
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
              (salePrice != 0)
                  ? Text(
                      salePriceText + ' VND',
                      style:
                          TextStyle(fontSize: FontSize.s24, color: kColorRed),
                    )
                  : Text(' ')
            ],
          )
        ],
      ),
    );
  }
}
