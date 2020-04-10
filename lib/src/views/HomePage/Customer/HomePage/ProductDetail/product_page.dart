import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:instacop/link.dart';
import 'package:instacop/src/helpers/colors_constant.dart';
import 'package:instacop/src/helpers/screen.dart';
import 'package:instacop/src/model/product.dart';
import 'package:instacop/src/widgets/button_raised.dart';

class ProductPage extends StatefulWidget {
  ProductPage({this.product});
  final Product product;
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List sizeList = ['S', 'M', 'L', 'XL'];
  List colorList = [];
  String sizeValue;
  double ratingValue = 0.5;
  bool isLoveCheck = true;
  bool isTest = false;
  int isColorFocus = 1;
  List<ColorInfo> listColorPicker = [];
  List<Color> listColor = [
    kColorWhite,
    kColorBlack,
    kColorRed,
    kColorBlue,
    kColorYellow,
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    int i = 1;
    for (var value in widget.product.colorList) {
      listColorPicker.add(ColorInfo(id: i, color: Color(value)));
      i++;
    }
    sizeList = widget.product.sizeList;
  }

  // Create Color Picker Bar
  Widget renderColorBar() {
    List<Widget> listWidget = [];
    for (var value in listColorPicker) {
      listWidget.add(Padding(
        padding: EdgeInsets.only(left: ConstScreen.setSizeWidth(8)),
        child: ColorPicker(
          color: value.color,
          isCheck: isColorFocus == value.id,
          onTap: () {
            setState(() {
              isColorFocus = value.id;
            });
          },
        ),
      ));
    }
    return Row(
      children: listWidget,
    );
  }

  @override
  Widget build(BuildContext context) {
    ConstScreen.setScreen(context);
    return Container(
      height: double.infinity,
      child: Column(
        children: <Widget>[
          //TODO: TOP
          Stack(
            children: <Widget>[
              CarouselSlider(
                height: ConstScreen.setSizeHeight(800),
                scrollDirection: Axis.horizontal,
                viewportFraction: 1.0,
                items: widget.product.imageList.map((image) {
                  return Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(image), fit: BoxFit.fill)),
                  );
                }).toList(),
              ),
              //TODO: Close Button
              Positioned(
                child: IconButton(
                  color: kColorBlack,
                  iconSize: ConstScreen.setSizeWidth(55),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios,
                      size: ConstScreen.setSizeWidth(40)),
                ),
              ),
              //TODO: Wistlist IconButton
              Positioned(
                left: ConstScreen.setSizeWidth(660),
                top: ConstScreen.setSizeHeight(5),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      isLoveCheck = !isLoveCheck;
                    });
                  },
                  icon: Icon(
                    isLoveCheck ? Icons.favorite : Icons.favorite_border,
                    color: isLoveCheck ? kColorRed : kColorBlack,
                    size: ConstScreen.setSizeHeight(60),
                  ),
                ),
              )
            ],
          ),

//             Bottom
          Container(
            color: kColorWhite,
            width: ConstScreen.setSizeWidth(750),
            child: Padding(
              padding: EdgeInsets.only(top: 8, bottom: 0, left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //TODO: Product name
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 14,
                        child: Text(
                          widget.product.productName,
                          style: TextStyle(
                            fontSize: FontSize.setTextSize(40),
                            fontWeight: FontWeight.w800,
                            color: kColorBlack,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: Container(
                            child: Padding(
                              padding:
                                  EdgeInsets.all(ConstScreen.setSizeWidth(7)),
                              child: Column(
                                children: <Widget>[
                                  Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: ConstScreen.setSizeWidth(40),
                                  ),
                                  Text(
                                    '1190',
                                    style: TextStyle(
                                        fontSize: FontSize.s30,
                                        fontWeight: FontWeight.bold,
                                        color: kColorBlack),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  //TODO: Price
                  Row(
                    children: <Widget>[
                      //TODO: Price
                      Text(
                        widget.product.price + ' USD',
                        style: TextStyle(
                            fontSize: FontSize.setTextSize(34),
                            color: kColorBlack,
                            decoration: (widget.product.salePrice != '0')
                                ? TextDecoration.lineThrough
                                : TextDecoration.none),
                      ),
                      SizedBox(
                        width: ConstScreen.setSizeHeight(20),
                      ),
                      //TODO: Sale Price
                      Text(
                        (widget.product.salePrice != '0')
                            ? widget.product.salePrice + ' USD'
                            : '',
                        style: TextStyle(
                            fontSize: FontSize.setTextSize(34),
                            color: kColorRed),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ConstScreen.setSizeHeight(5),
                  ),
                  //TODO: Color and Size Picker
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 4,
                        child: renderColorBar(),
                      ),
                      Expanded(
                        flex: 2,
                        child: DropdownButton(
                          style: TextStyle(fontSize: FontSize.s30),
                          value: sizeValue,
                          hint: Text('Select size'),
                          onChanged: (value) {
                            setState(() {
                              sizeValue = value;
                            });
                          },
                          items: sizeList.map((value) {
                            return DropdownMenuItem(
                              child: Text(
                                'Size ' + value,
                                style: TextStyle(
                                    color: kColorBlack, fontSize: FontSize.s30),
                              ),
                              value: value,
                            );
                          }).toList(),
                        ),
                      )
                    ],
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

class ColorPicker extends StatelessWidget {
  ColorPicker({this.isCheck = false, this.onTap, this.color});
  final bool isCheck;
  final Function onTap;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        height: ConstScreen.setSizeHeight(55),
        width: ConstScreen.setSizeWidth(55),
        decoration: BoxDecoration(
            border: (color == kColorWhite)
                ? Border.all(color: kColorBlack, width: 1)
                : Border.all(color: isCheck ? kColorBlack : color, width: 2),
            borderRadius: BorderRadius.circular(180),
            color: color),
        child: Center(
            child: isCheck
                ? Icon(
                    Icons.check,
                    size: ConstScreen.setSizeWidth(35),
                    color: (color == kColorBlack) ? kColorWhite : kColorBlack,
                  )
                : null),
      ),
    );
  }
}
