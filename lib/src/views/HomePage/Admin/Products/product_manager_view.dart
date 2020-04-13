import 'package:flutter/material.dart';
import 'package:instacop/src/helpers/TextStyle.dart';
import 'package:instacop/src/helpers/colors_constant.dart';
import 'package:instacop/src/helpers/screen.dart';

class ProductManager extends StatefulWidget {
  @override
  _ProductManagerState createState() => _ProductManagerState();
}

class _ProductManagerState extends State<ProductManager> {
  @override
  Widget build(BuildContext context) {
    ConstScreen.setScreen(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Product Manager',
          style: kBoldTextStyle.copyWith(
            fontSize: FontSize.setTextSize(32),
          ),
        ),
        backgroundColor: kColorWhite,
        iconTheme: IconThemeData.fallback(),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.add_comment,
                size: ConstScreen.setSizeWidth(45),
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'admin_home_product_adding');
              })
        ],
      ),
      body: Container(),
    );
  }
}
