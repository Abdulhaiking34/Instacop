import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instacop/src/helpers/screen.dart';
import 'package:instacop/src/helpers/shared_preferrence.dart';
import 'package:instacop/src/model/product.dart';
import 'package:instacop/src/views/HomePage/Customer/HomePage/ProductDetail/main_detail_product_view.dart';
import 'package:instacop/src/widgets/card_product.dart';

class WishListView extends StatefulWidget {
  @override
  _WishListViewState createState() => _WishListViewState();
}

class _WishListViewState extends State<WishListView>
    with AutomaticKeepAliveClientMixin {
  StreamController _streamController = new StreamController();
  List listProduct = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    StorageUtil.getUid().then((uid) {
      _streamController.add(uid);
    });
  }

  @override
  Widget build(BuildContext context) {
    ConstScreen.setScreen(context);
    return StreamBuilder(
        stream: _streamController.stream,
        builder: (context, snapshotMain) {
          if (snapshotMain.hasData) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  vertical: ConstScreen.setSizeHeight(10),
                  horizontal: ConstScreen.setSizeWidth(20)),
              child: StreamBuilder<QuerySnapshot>(
                  stream: Firestore.instance
                      .collection('Wishlists')
                      .document(snapshotMain.data)
                      .collection(snapshotMain.data)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData) {
                      listProduct = snapshot.data.documents
                          .map((DocumentSnapshot document) {
                        return ProductCard(
                          productName: document['name'],
                          image: document['image'][0],
                          price: int.parse(document['price']),
                          salePrice: int.parse(document['sale_price']),
                          isIconClose: true,
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
                                builder: (context) => MainDetailProductView(
                                  product: product,
                                ),
                              ),
                            );
                          },
                          onClosePress: () {
                            Firestore.instance
                                .collection('Wishlists')
                                .document(snapshotMain.data)
                                .collection(snapshotMain.data)
                                .document(document['id'])
                                .delete();
                          },
                        );
                      }).toList();
                      return GridView.count(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        crossAxisCount: 2,
                        crossAxisSpacing: ConstScreen.setSizeHeight(30),
                        mainAxisSpacing: ConstScreen.setSizeHeight(40),
                        childAspectRatio: 68 / 110,
                        children: listProduct,
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            );
          } else {
            return Container();
          }
        });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
