import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instacop/link.dart';
import 'package:instacop/src/helpers/colors_constant.dart';
import 'package:instacop/src/helpers/screen.dart';
import 'package:instacop/src/widgets/button_raised.dart';

class DetailProductView extends StatefulWidget {
  @override
  _DetailProductViewState createState() => _DetailProductViewState();
}

class _DetailProductViewState extends State<DetailProductView> {
  @override
  Widget build(BuildContext context) {
    ConstScreen.setScreen(context);
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
            child: Stack(
          children: <Widget>[
            // TOP
            Positioned(
              top: 0,
              left: 0,
              child: CarouselSlider(
                height: ConstScreen.setSize(1100),
                scrollDirection: Axis.horizontal,
                viewportFraction: 1.0,
                items: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(KImageAddress + 'banner_2.jpg'),
                            fit: BoxFit.fill)),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(KImageAddress + 'banner_2.jpg'),
                            fit: BoxFit.fill)),
                  ),
                ],
              ),
            ),

            // Bottom
            Positioned(
              top: ConstScreen.setSize(1000),
              left: 0,
              child: Container(
                height: ConstScreen.setSize(800),
                color: kColorWhite,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: ConstScreen.setSize(40),
                      horizontal: ConstScreen.setSize(40)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Product name
                      Text(
                        'PacSun Rommelo Hooded Flannel Shirt',
                        style: TextStyle(
                          fontSize: FontSize.setTextSize(35),
                          fontWeight: FontWeight.w800,
                          color: kColorBlack,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      // Price
                      Row(
                        children: <Widget>[
                          // Price
                          Text(
                            '29.90 USD',
                            style: TextStyle(
                                fontSize: FontSize.setTextSize(32),
                                color: kColorBlack,
                                decoration: TextDecoration.lineThrough),
                          ),
                          SizedBox(
                            width: ConstScreen.setSize(20),
                          ),
                          // Sale Price
                          Text(
                            '29.90 USD',
                            style: TextStyle(
                                fontSize: FontSize.setTextSize(32),
                                color: kColorRed),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          // Button add product to Cart
                          CusRaisedButton(
                            title: 'ADD',
                            backgroundColor: kColorBlack,
                            width: ConstScreen.setSize(1100),
                            onPress: () {},
                          ),
                          // Button add product to Wishlist
                          IconButton(
                            icon: Icon(
                              Icons.favorite_border,
                              color: kColorBlack,
                              size: ConstScreen.setSize(55),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        )),
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
