import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:instacop/link.dart';
import 'package:instacop/src/helpers/colors_constant.dart';
import 'package:instacop/src/helpers/screen.dart';
import 'package:instacop/src/widgets/box_info.dart';
import 'package:instacop/src/widgets/quantity_widget.dart';

class CartProductCard extends StatelessWidget {
  CartProductCard({
    this.productName = '',
    this.productSize = '',
    this.productColor = kColorWhite,
    this.productPrice = 0,
    this.productImage = '',
    this.quantity = 0,
    this.onQuantityChange,
    this.onClose,
  });
  final String productName;
  final Color productColor;
  final String productSize;
  final int productPrice;
  final int quantity;
  final String productImage;
  final Function onQuantityChange;
  final Function onClose;

  @override
  Widget build(BuildContext context) {
    var controller =
        new MaskedTextController(text: '', mask: '000,000,000,000');
    controller.updateText('$productPrice');
    String productPriceText = controller.text;
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: ConstScreen.setSizeHeight(15)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // TODO: Image Product
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ConstScreen.setSizeWidth(20)),
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: ConstScreen.setSizeHeight(380),
                      width: ConstScreen.setSizeWidth(280),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage(productImage),
                        fit: BoxFit.fill,
                      )),
                    ),
                    Positioned(
                      top: ConstScreen.setSizeWidth(-20),
                      left: ConstScreen.setSizeWidth(-20),
                      child: IconButton(
                        icon: Icon(
                          Icons.close,
                          size: ConstScreen.setSizeWidth(40),
                          color: kColorBlack.withOpacity(0.8),
                        ),
                        onPressed: () {
                          onClose();
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            //TODO: Detail product
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  //// TODO: Name Product
                  AutoSizeText(
                    productName,
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    minFontSize: 15,
                    style: TextStyle(
                        fontSize: FontSize.setTextSize(36),
                        color: kColorBlack,
                        fontWeight: FontWeight.w500),
                  ),
                  // TODO: Size and color Product
                  SizedBox(
                    height: ConstScreen.setSizeHeight(30),
                  ),
                  Row(
                    children: <Widget>[
                      // TODO: Product Color
                      Expanded(
                        flex: 1,
                        child: BoxInfo(
                          color: productColor,
                        ),
                      ),
                      SizedBox(
                        width: ConstScreen.setSizeWidth(5),
                      ),
                      // TODO: Product Size
                      Expanded(
                        flex: 1,
                        child: BoxInfo(
                          sizeProduct: productSize,
                        ),
                      ),

                      // TODO: Product Price
                      Expanded(
                        flex: 7,
                        child: AutoSizeText(
                          '$productPriceText VND',
                          maxLines: 1,
                          minFontSize: 10,
                          style: TextStyle(
                              fontSize: FontSize.setTextSize(35),
                              color: kColorBlack,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.end,
                        ),
                      ),
                      SizedBox(
                        width: ConstScreen.setSizeWidth(10),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ConstScreen.setSizeHeight(180),
                  ),
                  // TODO: Quantity
                  QuantityWidget(
                    value: quantity,
                    onChange: (value) {
                      onQuantityChange(value);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
