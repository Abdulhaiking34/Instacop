import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instacop/src/helpers/TextStyle.dart';
import 'package:instacop/src/helpers/colors_constant.dart';
import 'package:instacop/src/helpers/screen.dart';
import 'package:instacop/src/helpers/shared_preferrence.dart';
import 'package:instacop/src/helpers/utils.dart';
import 'package:instacop/src/model/orderInfo.dart';
import 'package:instacop/src/views/HomePage/Customer/ProfilePage/OrderAndBill/order_info_view.dart';
import 'package:instacop/src/widgets/OrderAdminCard.dart';
import 'package:instacop/src/widgets/card_order.dart';

class SoldAndOrderView extends StatefulWidget {
  SoldAndOrderView({this.title});
  final String title;
  @override
  _SoldAndOrderViewState createState() => _SoldAndOrderViewState();
}

class _SoldAndOrderViewState extends State<SoldAndOrderView> {
  StreamController _controller = new StreamController();
  String uid = '';
  bool isOrderPage;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.title == 'Order List') {
      isOrderPage = true;
    } else {
      isOrderPage = false;
    }
    StorageUtil.getUid().then((uid) {
      this.uid = uid;
      _controller.sink.add(true);
      _controller.close();
    });
  }

  @override
  Widget build(BuildContext context) {
    ConstScreen.setScreen(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.title,
          style: kBoldTextStyle.copyWith(
            fontSize: FontSize.setTextSize(32),
          ),
        ),
        backgroundColor: kColorWhite,
        iconTheme: IconThemeData.fallback(),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ConstScreen.setSizeWidth(20),
              vertical: ConstScreen.setSizeHeight(20)),
          child: StreamBuilder(
            stream: _controller.stream,
            builder: (context, mainSnapshot) {
              if (mainSnapshot.hasData) {
                return StreamBuilder<QuerySnapshot>(
                    stream: isOrderPage
                        ? Firestore.instance
                            .collection('Orders')
                            .where('status', isEqualTo: 'Pending')
                            .snapshots()
                        : Firestore.instance
                            .collection('Orders')
                            .where('status', isLessThan: 'Pending')
                            .snapshots(),
                    builder: (context, snapshot) {
                      if (mainSnapshot.hasData && snapshot.hasData) {
                        return ListView(
                          children: snapshot.data.documents
                              .map((DocumentSnapshot document) {
                            OrderInfo orderInfo = new OrderInfo(
                                id: document['id'],
                                subId: document['sub_Id'],
                                customerName: document['customer_name'],
                                receiverName: document['receiver_name'],
                                address: document['address'],
                                phone: document['phone'],
                                status: document['status'],
                                total: Util.intToMoneyType(
                                    int.parse(document['total'])),
                                createAt: Util.convertDateToString(
                                    document['create_at']));
                            if (isOrderPage) {
                              //TODO: Order List View
                              return OrderAdminCard(
                                id: document['sub_Id'],
                                date: Util.convertDateToString(
                                    document['create_at']),
                                customerName: document['customer_name'],
                                status: document['status'],
                                total: Util.intToMoneyType(
                                    int.parse(document['total'])),
                                isEnableCancel:
                                    (document['status'] != 'Canceled'),
                                onViewDetail: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => OrderInfoView(
                                                orderInfo: orderInfo,
                                                id: document['sub_Id'],
                                              )));
                                },
                                onAccept: () {
                                  //TODO: Accept order
                                  Firestore.instance
                                      .collection('Orders')
                                      .document(document['sub_Id'])
                                      .updateData({'status': 'Completed'});
                                  //TODO: decrease quantity
                                  Firestore.instance
                                      .collection('Orders')
                                      .document(document['sub_Id'])
                                      .collection(document['id'])
                                      .getDocuments()
                                      .then((document) {
                                    List<QuantityOrder> quantityOrderList = [];
                                    for (var document in document.documents) {
                                      QuantityOrder quantityOrder =
                                          new QuantityOrder(
                                              productId: document['id'],
                                              quantity: int.parse(
                                                  document['quantity']));
                                      quantityOrderList.add(quantityOrder);
                                    }
                                    for (var qtyOrder in quantityOrderList) {
                                      Firestore.instance
                                          .collection('Products')
                                          .document(qtyOrder.productId)
                                          .get()
                                          .then((document) {
                                        int quantity = int.parse(
                                            document.data['quantity']);
                                        int result =
                                            quantity - qtyOrder.quantity;
                                        Firestore.instance
                                            .collection('Products')
                                            .document(qtyOrder.productId)
                                            .updateData({
                                          'quantity': result.toString()
                                        });
                                      });
                                    }
                                  });
                                },
                                onCancel: () {
                                  Firestore.instance
                                      .collection('Orders')
                                      .document(document['sub_Id'])
                                      .updateData({'status': 'Canceled'});
                                },
                              );
                            } else {
                              //TODO: Sold order list view
                              return OrderCard(
                                id: document['sub_Id'],
                                date: Util.convertDateToString(
                                    document['create_at']),
                                customerName: document['customer_name'],
                                status: document['status'],
                                total: Util.intToMoneyType(
                                    int.parse(document['total'])),
                                isEnableCancel:
                                    (document['status'] != 'Canceled' &&
                                        document['status'] != 'Completed'),
                                onViewDetail: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => OrderInfoView(
                                                orderInfo: orderInfo,
                                                id: document['sub_Id'],
                                              )));
                                },
                                onCancel: () {
                                  Firestore.instance
                                      .collection('Orders')
                                      .document(document['sub_Id'])
                                      .updateData({'status': 'Canceled'});
                                },
                              );
                            }
                          }).toList(),
                        );
                      } else
                        return Container();
                    });
              } else
                return Center(
                  child: CircularProgressIndicator(),
                );
            },
          )),
    );
  }
}

class QuantityOrder {
  int quantity;

  QuantityOrder({this.quantity, this.productId});

  String productId;
}
