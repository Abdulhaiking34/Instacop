import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:instacop/link.dart';
import 'package:instacop/src/helpers/colors_constant.dart';
import 'package:instacop/src/helpers/screen.dart';
import 'package:instacop/src/widgets/button_raised.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  double ratingValue = 0.5;
  bool isLoveCheck = true;
  @override
  Widget build(BuildContext context) {
    ConstScreen.setScreen(context);
    return Container(
      height: double.infinity,
      child: Column(
        children: <Widget>[
          // TOP
          Stack(
            children: <Widget>[
              CarouselSlider(
                height: ConstScreen.setSizeHeight(800),
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
              Positioned(
                child: IconButton(
                  color: kColorBlack,
                  iconSize: ConstScreen.setSizeWidth(55),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close),
                ),
              )
            ],
          ),

//             Bottom
          Container(
            color: kColorWhite,
            width: ConstScreen.setSizeWidth(750),
            child: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 0, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Product name
                  Text(
                    'PacSun Rommelo Hooded Flannel Shirt',
                    style: TextStyle(
                      fontSize: FontSize.setTextSize(40),
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
                            fontSize: FontSize.setTextSize(34),
                            color: kColorBlack,
                            decoration: TextDecoration.lineThrough),
                      ),
                      SizedBox(
                        width: ConstScreen.setSizeHeight(20),
                      ),
                      // Sale Price
                      Text(
                        '29.90 USD',
                        style: TextStyle(
                            fontSize: FontSize.setTextSize(34),
                            color: kColorRed),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ConstScreen.setSizeHeight(5),
                  ),
                  // Rating Bar
                  RatingBar(
                    allowHalfRating: true,
                    initialRating: ratingValue,
                    itemCount: 5,
                    minRating: 0,
                    itemSize: ConstScreen.setSizeHeight(55),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amberAccent,
                    ),
                    onRatingUpdate: (rating) {
                      ratingValue = rating;
                    },
                  ),
                  SizedBox(
                    height: ConstScreen.setSizeHeight(20),
                  ),
                  //Button Add and WistList
                  Row(
                    children: <Widget>[
                      // Button add product to Cart
                      Expanded(
                        flex: 5,
                        child: CusRaisedButton(
                          title: 'ADD',
                          backgroundColor: kColorBlack,
                          onPress: () {},
                        ),
                      ),
                      // Button add product to Wishlist
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              isLoveCheck = !isLoveCheck;
                            });
                          },
                          icon: Icon(
                            isLoveCheck
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: isLoveCheck ? kColorRed : kColorBlack,
                            size: ConstScreen.setSizeHeight(60),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
