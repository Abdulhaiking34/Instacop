import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    RatingProductPage(),
    DetailOfProductPage(),
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

//Top

//CarouselSlider(
//height: ConstScreen.setSize(1000),
//scrollDirection: Axis.horizontal,
//viewportFraction: 1.0,
//items: <Widget>[
//Container(
//decoration: BoxDecoration(
//image: DecorationImage(
//image: AssetImage(KImageAddress + 'banner_2.jpg'),
//fit: BoxFit.fill)),
//),
//Container(
//decoration: BoxDecoration(
//image: DecorationImage(
//image: AssetImage(KImageAddress + 'banner_2.jpg'),
//fit: BoxFit.fill)),
//),
//],
//),

// Bottom
//Container(
//height: ConstScreen.setSize(1200),
//color: kColorWhite,
//child: Padding(
//padding: EdgeInsets.symmetric(
//vertical: ConstScreen.setSize(40),
//horizontal: ConstScreen.setSize(40)),
//child: Column(
//crossAxisAlignment: CrossAxisAlignment.start,
//children: <Widget>[
//// Product name
//Text(
//'PacSun Rommelo Hooded Flannel Shirt',
//style: TextStyle(
//fontSize: FontSize.setTextSize(35),
//fontWeight: FontWeight.w800,
//color: kColorBlack,
//),
//),
//SizedBox(
//height: 5,
//),
//// Price
//Row(
//children: <Widget>[
//// Price
//Text(
//'29.90 USD',
//style: TextStyle(
//fontSize: FontSize.setTextSize(32),
//color: kColorBlack,
//decoration: TextDecoration.lineThrough),
//),
//SizedBox(
//width: ConstScreen.setSize(20),
//),
//// Sale Price
//Text(
//'29.90 USD',
//style: TextStyle(
//fontSize: FontSize.setTextSize(32),
//color: kColorRed),
//),
//],
//),
//SizedBox(
//height: 10,
//),
//Row(
//mainAxisAlignment: MainAxisAlignment.spaceBetween,
//children: <Widget>[
//// Button add product to Cart
//CusRaisedButton(
//title: 'ADD',
//backgroundColor: kColorBlack,
//width: 550,
//onPress: () {},
//),
//// Button add product to Wishlist
//IconButton(
//icon: Icon(
//Icons.favorite_border,
//color: kColorBlack,
//size: ConstScreen.setSize(55),
//),
//),
//],
//)
//],
//),
//),
//),
