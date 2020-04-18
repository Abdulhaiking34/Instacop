import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instacop/src/helpers/TextStyle.dart';
import 'package:instacop/src/helpers/colors_constant.dart';
import 'package:instacop/src/helpers/screen.dart';
import 'package:instacop/src/helpers/shared_preferrence.dart';
import 'package:instacop/src/model/product.dart';
import 'package:instacop/src/widgets/card_product.dart';

import 'ProductDetail/main_detail_product_view.dart';

class ProductListView extends StatefulWidget {
  ProductListView({this.search});
  final String search;
  @override
  _DetailBannerScreenState createState() => _DetailBannerScreenState();
}

class _DetailBannerScreenState extends State<ProductListView> {
  bool isSearch = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.search != '') {
      isSearch = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    ConstScreen.setScreen(context);
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData.fallback(),
          backgroundColor: kColorWhite,
          centerTitle: true,
          title: Text(
            isSearch ? 'SEARCH' : 'NEW IN',
            style: kBoldTextStyle.copyWith(fontSize: FontSize.s36),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                FontAwesomeIcons.shoppingBag,
              ),
              onPressed: () {
                StorageUtil.getIsLogging().then((bool value) {
                  if (value != null) {
                    Navigator.pushNamed(context, 'customer_cart_page');
                  } else {
                    Navigator.pushNamed(context, 'register_screen');
                  }
                });
              },
            ),
          ]),
      body: Container(
        color: kColorWhite,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: ConstScreen.setSizeHeight(40),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: ConstScreen.setSizeHeight(30),
                    right: ConstScreen.setSizeHeight(30),
                    bottom: ConstScreen.setSizeHeight(30),
                  ),
                  child: StreamBuilder<QuerySnapshot>(
                      stream: isSearch
                          ? Firestore.instance
                              .collection('Products')
                              .orderBy('create_at')
                              .where('categogy', isEqualTo: widget.search)
                              .snapshots()
                          : Firestore.instance
                              .collection('Products')
                              .orderBy('create_at')
                              .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return Text('Loading...');
                        } else {
                          return GridView.count(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            crossAxisCount: 2,
                            crossAxisSpacing: ConstScreen.setSizeHeight(30),
                            mainAxisSpacing: ConstScreen.setSizeHeight(40),
                            childAspectRatio: 66 / 110,
                            children: snapshot.data.documents
                                .map((DocumentSnapshot document) {
                              return ProductCard(
                                productName: document['name'],
                                image: document['image'][0],
                                price: int.parse(document['price']),
                                salePrice: (document['sale_price'] != '0')
                                    ? int.parse(document['sale_price'])
                                    : 0,
                                onTap: () {
                                  Product product = new Product(
                                    id: document['id'],
                                    productName: document['name'],
                                    imageList: document['image'],
                                    category: document['categogy'],
                                    sizeList: document['size'],
                                    colorList: document['color'],
                                    price: document['price'],
                                    salePrice: document['sale_price'],
                                    brand: document['brand'],
                                    madeIn: document['made_in'],
                                    quantity: document['quantity'],
                                    description: document['description'],
                                    rating: document['rating'],
                                  );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          MainDetailProductView(
                                        product: product,
                                      ),
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                          );
                        }
                      }),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
