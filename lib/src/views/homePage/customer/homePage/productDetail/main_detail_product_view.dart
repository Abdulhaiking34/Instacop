import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:instacop/src/helpers/colors_constant.dart';
import 'package:instacop/src/helpers/screen.dart';
import 'package:instacop/src/views/homePage/customer/homePage/productDetail/detail_product_page.dart';
import 'package:instacop/src/views/homePage/customer/homePage/productDetail/product_page.dart';
import 'package:instacop/src/views/homePage/customer/homePage/productDetail/rating_product_page.dart';

class MainDetailProductView extends StatefulWidget {
  @override
  _MainDetailProductViewState createState() => _MainDetailProductViewState();
}

class _MainDetailProductViewState extends State<MainDetailProductView> {
  List tabProduct = [
    ProductPage(),
    DetailOfProductPage(),
    RatingProductPage(),
  ];
  int indexPage = 0;
  @override
  Widget build(BuildContext context) {
    ConstScreen.setScreen(context);
    return Scaffold(
      body: SafeArea(child: tabProduct[indexPage]),
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
