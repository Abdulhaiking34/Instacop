import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instacop/src/helpers/utils.dart';
import 'package:instacop/src/widgets/category_item.dart';

class PriceVolatilityChart extends StatefulWidget {
  @override
  _PriceVolatilityChartState createState() => _PriceVolatilityChartState();
}

class _PriceVolatilityChartState extends State<PriceVolatilityChart> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('Products').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: snapshot.data.documents.map((document) {
                List<CategoryItem> listPriceVolatility = [];
                Firestore.instance
                    .collection('PriceVolatility')
                    .where('product_id', isEqualTo: document.documentID)
                    .getDocuments()
                    .then((value) {
                  for (var docs in value.documents) {
                    var widget = CategoryItem(
                      title: 'Price: ' +
                          Util.intToMoneyType(int.parse(docs.data['price'])) +
                          ' VND\nSale price: ' +
                          Util.intToMoneyType(
                              int.parse(docs.data['sale_price'])) +
                          ' VND\nCreate at: ' +
                          Util.convertDateToFullString(docs.data['create_at']),
                      height: 130,
                    );
                    listPriceVolatility.add(widget);
                  }
                });
                return Card(
                  child: ExpansionTile(
                    title: Text(
                        'ID: ${document.data['id']}\nProduct: ${document.data['name']}'),
                    children: listPriceVolatility,
                  ),
                );
              }).toList(),
            );
          } else {
            return Container();
          }
        });
  }
}
