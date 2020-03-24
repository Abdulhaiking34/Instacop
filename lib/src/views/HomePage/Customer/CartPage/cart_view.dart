import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:instacop/link.dart';
import 'package:instacop/src/helpers/colors_constant.dart';
import 'package:instacop/src/helpers/screen.dart';
import 'package:instacop/src/widgets/button_raised.dart';
import 'package:instacop/src/widgets/card_cart_product.dart';

class CartView extends StatefulWidget {
  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  int quantity = 0;
  int quantity1 = 0;
  int totalPrice = 1000000000;
  @override
  Widget build(BuildContext context) {
    ConstScreen.setScreen(context);
    var controller =
        new MaskedTextController(text: '', mask: '000,000,000,000');
    controller.updateText('$totalPrice');
    String totalPriceText = controller.text;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData.fallback(),
          backgroundColor: kColorWhite,
          // TODO: Quantity Items
          title: Text(
            '2 items',
            style: TextStyle(
                color: kColorBlack,
                fontSize: FontSize.setTextSize(32),
                fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          //TODO: List product
          children: <Widget>[
            CartProductCard(
              productName: 'Planel Pacon x Suprime ',
              productPrice: 1000000,
              productColor: kColorBlue,
              productSize: 'XXL',
              productImage: KImageAddress + 'plannel_2.jpg',
              quantity: quantity,
              onQuantityChange: (value) {
                setState(() {
                  quantity = value;
                });
              },
            ),
            CartProductCard(
              productName: 'Hoodie LST x Suprime',
              productPrice: 500000,
              productColor: kColorBlue,
              productSize: 'L',
              productImage: KImageAddress + 'hoodie_2.jpg',
              quantity: quantity1,
              onQuantityChange: (value) {
                setState(() {
                  quantity1 = value;
                });
              },
            ),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: kColorBlack.withOpacity(0.5), width: 1),
            ),
          ),
          height: ConstScreen.setSizeHeight(200),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: ConstScreen.setSizeHeight(15),
                horizontal: ConstScreen.setSizeWidth(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // TODO: Total price
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: ConstScreen.setSizeHeight(5),
                        horizontal: ConstScreen.setSizeWidth(20)),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: AutoSizeText(
                            'Total',
                            style: TextStyle(
                                fontSize: FontSize.s36,
                                fontWeight: FontWeight.bold),
                            minFontSize: 15,
                          ),
                        ),
                        // TODO: Total Price Value
                        Expanded(
                          flex: 5,
                          child: AutoSizeText(
                            totalPriceText + ' VND',
                            style: TextStyle(
                                fontSize: FontSize.setTextSize(45),
                                fontWeight: FontWeight.bold),
                            minFontSize: 15,
                            maxLines: 1,
                            textAlign: TextAlign.end,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                //TODO: Purchase button
                Expanded(
                  flex: 1,
                  child: CusRaisedButton(
                    title: 'PROCESS ORDER',
                    backgroundColor: kColorBlack,
                    onPress: () {},
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
