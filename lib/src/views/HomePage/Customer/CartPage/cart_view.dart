import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:instacop/src/helpers/colors_constant.dart';
import 'package:instacop/src/helpers/screen.dart';
import 'package:instacop/src/helpers/shared_preferrence.dart';
import 'package:instacop/src/model/product.dart';
import 'package:instacop/src/widgets/button_raised.dart';
import 'package:instacop/src/widgets/card_cart_product.dart';

class CartView extends StatefulWidget {
  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  StreamController _streamController = new StreamController();
  StreamController _productController = new StreamController();
  List<Product> productInfotList = [];
  List<CartProductCard> uiProductList = [];
  int totalPrice = 0;
  String totalPriceText = '';
  //TODO: Delete product
  void onClose(String productID) {
    // TODO: find Product widget
    var find = uiProductList.firstWhere((it) => it.id == productID,
        orElse: () => null);
    if (find != null) {
      setState(() {
        uiProductList.removeAt(uiProductList.indexOf(find));
      });
    } else {
      print(('Close faild'));
    }
    // TODO: find Product Info
    var findProInfo = productInfotList.firstWhere((it) => it.id == productID,
        orElse: () => null);
    if (findProInfo != null) {
      productInfotList.removeAt(productInfotList.indexOf(findProInfo));
      getTotal();
    }
  }

//TODO: Update new quantity
  void onChangeQty(String qty, String productID) {
    var find = productInfotList.firstWhere((it) => it.id == productID,
        orElse: () => null);
    if (find != null) {
      int index = productInfotList.indexOf(find);
      productInfotList.elementAt(index).quantity = qty;
      getTotal();
    }
  }

//TODO: get total
  void getTotal() {
    totalPrice = 0;
    for (var product in productInfotList) {
      totalPrice += (int.parse(product.price) * int.parse(product.quantity));
    }
    var controller =
        new MaskedTextController(text: '', mask: '000,000,000,000,000');
    controller.updateText('$totalPrice');
    setState(() {
      totalPriceText = controller.text;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    StorageUtil.getUid().then((uid) {
      _streamController.add(uid);
      //TODO: count item
      Firestore.instance
          .collection('Carts')
          .document(uid)
          .collection(uid)
          .getDocuments()
          .then((onValue) {
        int index = 0;
        //TODO:Get list product
        for (var value in onValue.documents) {
          Product product = new Product(
            id: value.data['id'],
            productName: value.data['name'],
            image: value.data['image'],
            category: value.data['categogy'],
            size: value.data['size'],
            color: value.data['color'],
            price: value.data['price'],
            salePrice: value.data['sale_price'],
            brand: value.data['brand'],
            madeIn: value.data['made_in'],
            quantity: value.data['quantity'],
          );
          productInfotList.add(product);
        }
        // TODO: add list product widget
        uiProductList = productInfotList.map((product) {
          return CartProductCard(
            id: product.id,
            productName: product.productName,
            productPrice: int.parse(product.price),
            productColor: Color(product.color),
            productSize: product.size,
            productImage: product.image,
            brand: product.brand,
            madeIn: product.madeIn,
            quantity: product.quantity,
            onQtyChange: (qty) {
              print(qty);
              onChangeQty(qty, product.id);
            },
            onClose: () {
              onClose(product.id);
            },
          );
        }).toList();
        //TODO: update Item count
        setState(() {
          uiProductList.length;
        });
        getTotal();
        _productController.sink.add(true);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    ConstScreen.setScreen(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData.fallback(),
          backgroundColor: kColorWhite,
          // TODO: Quantity Items
          title: Text(
            uiProductList.length.toString() + ' items',
            style: TextStyle(
                color: kColorBlack,
                fontSize: FontSize.setTextSize(32),
                fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        body: StreamBuilder(
          stream: _streamController.stream,
          builder: (context, snapshotMain) {
            if (snapshotMain.hasData) {
              //TODO: Load list cart product
              return StreamBuilder(
                stream: _productController.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: uiProductList.length,
                        itemBuilder: (_, index) => uiProductList[index]);
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: kColorBlack.withOpacity(0.5), width: 1),
            ),
          ),
          height: ConstScreen.setSizeHeight(200),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: ConstScreen.setSizeHeight(15),
                horizontal: ConstScreen.setSizeWidth(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // TODO: Total price
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: ConstScreen.setSizeHeight(5),
                        horizontal: ConstScreen.setSizeWidth(20)),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: AutoSizeText(
                            'Total',
                            style: TextStyle(
                                fontSize: FontSize.s36,
                                fontWeight: FontWeight.bold),
                            minFontSize: 15,
                          ),
                        ),
                        // TODO: Total Price Value
                        Expanded(
                          flex: 5,
                          child: AutoSizeText(
                            totalPriceText + ' VND',
                            style: TextStyle(
                                fontSize: FontSize.setTextSize(45),
                                fontWeight: FontWeight.bold),
                            minFontSize: 15,
                            maxLines: 1,
                            textAlign: TextAlign.end,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                //TODO: Purchase button
                Expanded(
                  flex: 1,
                  child: CusRaisedButton(
                    title: 'PROCESS ORDER',
                    backgroundColor: kColorBlack,
                    onPress: () {
                      print(productInfotList.length);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//StreamBuilder<QuerySnapshot>(
//stream: Firestore.instance
//    .collection('Carts')
//.document(snapshotMain.data)
//.collection(snapshotMain.data)
//.snapshots(),
//builder: (BuildContext context,
//    AsyncSnapshot<QuerySnapshot> snapshot) {
//if (snapshot.hasData) {
//final snapProduct = snapshot.data.documents;
////                      for (var value in snapProduct) {
////                        Product product = new Product(
////                          id: value.data['id'],
////                          productName: value.data['name'],
////                          image: value.data['image'],
////                          category: value.data['categogy'],
////                          size: value.data['size'],
////                          color: value.data['color'],
////                          price: value.data['price'],
////                          salePrice: value.data['sale_price'],
////                          brand: value.data['brand'],
////                          madeIn: value.data['made_in'],
////                          quantity: value.data['quantity'],
////                        );
////                        final uiProductCard = CartProductCard(
////                          productName: value.data['name'],
////                          productPrice: int.parse(value.data['price']),
////                          productColor: Color(value.data['color']),
////                          productSize: value.data['size'],
////                          productImage: value.data['image'],
////                          brand: value.data['brand'],
////                          madeIn: value.data['made_in'],
////                          quantity: value.data['quantity'],
////                          onQtyChange: (qty) {},
////                          onClose: () {},
////                        );
////                        producInfotList.add(product);
////                        uiProductList.add(uiProductCard);
////                      }
//
//return ListView(
//scrollDirection: Axis.vertical,
////TODO: List product
//children: uiProductList
////                        snapshot.data.documents
////                            .map((DocumentSnapshot document) {
////                          return CartProductCard(
////                            productName: document['name'],
////                            productPrice: int.parse(document['price']),
////                            productColor: Color(document['color']),
////                            productSize: document['size'],
////                            productImage: document['image'],
////                            brand: document['brand'],
////                            madeIn: document['made_in'],
////                            quantity: document['quantity'],
////                            onQtyChange: (qty) {},
////                            onClose: () {},
////                          );
////                        }).toList(),
//);
//} else {
//return Center(child: CircularProgressIndicator());
//}
//});
