import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instacop/src/helpers/TextStyle.dart';
import 'package:instacop/src/helpers/colors_constant.dart';
import 'package:instacop/src/helpers/screen.dart';
import 'package:instacop/src/helpers/utils.dart';
import 'package:instacop/src/widgets/card_admin_product.dart';

class ProductManager extends StatefulWidget {
  @override
  _ProductManagerState createState() => _ProductManagerState();
}

class _ProductManagerState extends State<ProductManager> {
  @override
  Widget build(BuildContext context) {
    ConstScreen.setScreen(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Product Manager',
            style: kBoldTextStyle.copyWith(
              fontSize: FontSize.setTextSize(32),
            ),
          ),
          backgroundColor: kColorWhite,
          iconTheme: IconThemeData.fallback(),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.add_comment,
                  size: ConstScreen.setSizeWidth(45),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'admin_home_product_adding');
                })
          ],
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('Products').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: snapshot.data.documents.map((document) {
                  return AdminProductCard(
                    productName: document['name'],
                    quantity: document['quantity'],
                    productPrice: int.parse(document['price']),
                    productSalePrice: int.parse(document['sale_price']),
                    brand: document['brand'],
                    category: document['categogy'],
                    madeIn: document['made_in'],
                    createAt: Util.convertDateToString(document['create_at']),
                    productSizeList: document['size'],
                    productColorList: document['color'],
                    productImage: document['image'][0],
                    onClose: () {
                      Firestore.instance
                          .collection('Products')
                          .document(document.documentID)
                          .delete();
                    },
                    onEdit: () {},
                  );
                }).toList(),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
