import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
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
      this.isIconClose = false,
      this.onClosePress,
      this.onTap});

  final String productName;
  final String image;
  final int price;
  final int salePrice;
  final bool isIconClose;
  final Function onTap;
  final Function onClosePress;
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
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: kColorLightGrey),
        ),
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // TODO: Product Image
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
                //TODO: Product Name
                AutoSizeText(
                  productName,
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: FontSize.s24,
                      color: kColorBlack,
                      fontWeight: FontWeight.w400),
                  minFontSize: 15,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
                //TODO: Product Price
                AutoSizeText(
                  priceText + ' VND',
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: FontSize.s24,
                      color: kColorBlack,
                      decoration: (salePrice != 0)
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                  minFontSize: 5,
                  textAlign: TextAlign.center,
                ),
                //TODO: Sale Price
                (salePrice != 0)
                    ? AutoSizeText(
                        salePriceText + ' VND',
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: FontSize.s24,
                          color: kColorRed,
                        ),
                        minFontSize: 5,
                        textAlign: TextAlign.center,
                      )
                    : Text(' '),
              ],
            ),
            isIconClose
                ? Positioned(
                    left: ConstScreen.setSizeWidth(250),
                    top: ConstScreen.setSizeWidth(-20),
                    child: IconButton(
                      onPressed: () {
                        onClosePress();
                      },
                      icon: Icon(
                        Icons.close,
                        size: ConstScreen.setSizeWidth(30),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
