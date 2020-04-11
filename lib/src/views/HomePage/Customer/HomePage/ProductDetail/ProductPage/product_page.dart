import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:instacop/link.dart';
import 'package:instacop/src/helpers/TextStyle.dart';
import 'package:instacop/src/helpers/colors_constant.dart';
import 'package:instacop/src/helpers/screen.dart';
import 'package:instacop/src/model/product.dart';
import 'package:instacop/src/views/HomePage/Customer/HomePage/ProductDetail/ProductPage/product_controller.dart';
import 'package:instacop/src/views/HomePage/Customer/HomePage/ProductDetail/image_product_view.dart';
import 'package:instacop/src/widgets/button_raised.dart';
import 'package:progress_dialog/progress_dialog.dart';

class ProductPage extends StatefulWidget {
  ProductPage({this.product});
  final Product product;
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  ProgressDialog pr;
  List sizeList = ['S', 'M', 'L', 'XL'];
  List colorList = [];
  double ratingValue = 0.5;
  bool isLoveCheck = false;
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
  ProductController _controller = new ProductController();
  //TODO: value
  int colorValue;
  String sizeValue;

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
    colorValue = listColorPicker.elementAt(0).color.value;
    print(widget.product.category);
  }

  //TODO: Create Color Picker Bar
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
            //TODO: color value pick
            colorValue = value.color.value;
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
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ImageProductView(
                                    image: image,
                                  )));
                    },
                    child: CachedNetworkImage(
                      width: double.infinity,
                      imageUrl: image,
                      fit: BoxFit.fitHeight,
                      placeholder: (context, url) => Container(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
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
                      isLoveCheck = true;
                    });
//                    if (!isLoveCheck) {
//                      _controller
//                          .addProductToWishlist(product: widget.product)
//                          .then((value) {
//                        if (value) {
//                          setState(() {
//                            isLoveCheck = true;
//                          });
//                          Scaffold.of(context).showSnackBar(SnackBar(
//                            backgroundColor: kColorWhite,
//                            content: Row(
//                              children: <Widget>[
//                                Icon(
//                                  Icons.check,
//                                  color: kColorGreen,
//                                  size: ConstScreen.setSizeWidth(50),
//                                ),
//                                SizedBox(
//                                  width: ConstScreen.setSizeWidth(20),
//                                ),
//                                Expanded(
//                                  child: Text(
//                                    'Product has been add to Wishlist.',
//                                    style: kBoldTextStyle.copyWith(
//                                        fontSize: FontSize.s28),
//                                  ),
//                                )
//                              ],
//                            ),
//                          ));
//                        }
//                      });
//                    }
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
                        child: StreamBuilder(
                            stream: _controller.sizeStream,
                            builder: (context, snapshot) {
                              return DropdownButton(
                                isExpanded: true,
                                style: TextStyle(fontSize: FontSize.s30),
                                value: sizeValue,
                                hint: (snapshot.hasError)
                                    ? Text(
                                        snapshot.error,
                                        style: kBoldTextStyle.copyWith(
                                            color: kColorRed),
                                      )
                                    : Text('Select size'),
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
                                          color: kColorBlack,
                                          fontSize: FontSize.s30),
                                    ),
                                    value: value,
                                  );
                                }).toList(),
                              );
                            }),
                      )
                    ],
                  ),
                  SizedBox(
                    height: ConstScreen.setSizeHeight(20),
                  ),
                  //Button Add
                  Row(
                    children: <Widget>[
                      //TODO: Button add product to Cart
                      Expanded(
                        flex: 5,
                        child: CusRaisedButton(
                          title: 'ADD',
                          backgroundColor: kColorBlack,
                          onPress: () async {
                            //TODO: Process Dialog
                            bool isShow = true;
                            String messing = 'Please wait...';
                            pr = new ProgressDialog(context,
                                type: ProgressDialogType.Normal,
                                showLogs: true);
                            pr.show();
                            pr.update(message: messing);
                            //TODO: Add product
                            await _controller
                                .addProductToCart(
                                    color: colorValue,
                                    size: sizeValue,
                                    product: widget.product)
                                .then((isComplete) {
                              pr.hide();
                              if (isComplete) {
                                Scaffold.of(context).showSnackBar(SnackBar(
                                  backgroundColor: kColorWhite,
                                  content: Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.check,
                                        color: kColorGreen,
                                        size: ConstScreen.setSizeWidth(50),
                                      ),
                                      SizedBox(
                                        width: ConstScreen.setSizeWidth(20),
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Product has been add to Your Cart.',
                                          style: kBoldTextStyle.copyWith(
                                              fontSize: FontSize.s28),
                                        ),
                                      )
                                    ],
                                  ),
                                ));
                              } else {
                                Scaffold.of(context).showSnackBar(SnackBar(
                                  backgroundColor: kColorWhite,
                                  content: Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.error,
                                        color: kColorRed,
                                        size: ConstScreen.setSizeWidth(50),
                                      ),
                                      SizedBox(
                                        width: ConstScreen.setSizeWidth(20),
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Added error.',
                                          style: kBoldTextStyle.copyWith(
                                              fontSize: FontSize.s28),
                                        ),
                                      )
                                    ],
                                  ),
                                ));
                              }
                            });
                          },
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
