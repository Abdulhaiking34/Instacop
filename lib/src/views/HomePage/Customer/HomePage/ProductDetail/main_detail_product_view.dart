import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instacop/src/helpers/colors_constant.dart';
import 'package:instacop/src/helpers/screen.dart';
import 'package:instacop/src/model/product.dart';
import 'package:instacop/src/views/HomePage/Customer/HomePage/ProductDetail/detail_product_page.dart';
import 'package:instacop/src/views/HomePage/Customer/HomePage/ProductDetail/ProductPage/product_page.dart';
import 'package:instacop/src/views/HomePage/Customer/HomePage/ProductDetail/rating_product_page.dart';

class MainDetailProductView extends StatefulWidget {
  MainDetailProductView({this.product});
  final Product product;
  @override
  _MainDetailProductViewState createState() => _MainDetailProductViewState();
}

class _MainDetailProductViewState extends State<MainDetailProductView> {
  Widget getPage(int index) {
    switch (index) {
      case 0:
        return ProductPage(
          product: widget.product,
        );
      case 1:
        return DetailOfProductPage(
          product: widget.product,
        );
      case 2:
        return RatingProductPage(product: widget.product);
    }
  }

  int indexPage = 0;
  @override
  Widget build(BuildContext context) {
    ConstScreen.setScreen(context);

    return Scaffold(
      body: SafeArea(child: getPage(indexPage)),
      bottomNavigationBar: SizedBox(
        height: ConstScreen.setSizeHeight(115),
        child: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              indexPage = index;
            });
          },
          currentIndex: indexPage,
          unselectedFontSize: FontSize.s25,
          selectedFontSize: FontSize.s28,
          selectedItemColor: kColorBlack,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          iconSize: ConstScreen.setSizeHeight(0.1),
          items: [
            BottomNavigationBarItem(
                title: Text('Product'), icon: Icon(Icons.rate_review)),
            BottomNavigationBarItem(
                title: Text('Detail'), icon: Icon(Icons.rate_review)),
            BottomNavigationBarItem(
                title: Text('Rating'), icon: Icon(Icons.rate_review)),
          ],
        ),
      ),
    );
  }
}
