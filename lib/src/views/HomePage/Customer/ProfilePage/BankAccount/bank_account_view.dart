import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instacop/src/helpers/TextStyle.dart';
import 'package:instacop/src/helpers/colors_constant.dart';
import 'package:instacop/src/helpers/screen.dart';
import 'package:instacop/src/helpers/shared_preferrence.dart';
import 'package:instacop/src/views/HomePage/Customer/ProfilePage/BankAccount/bank_acount_adding_view.dart';
import 'package:instacop/src/views/HomePage/Customer/ProfilePage/BankAccount/bank_card_controller.dart';

class BankAccountView extends StatefulWidget {
  final _globalKey = new GlobalKey<ScaffoldState>();
  @override
  _BankAccountViewState createState() => _BankAccountViewState();
}

class _BankAccountViewState extends State<BankAccountView> {
  BankCardController _controller = new BankCardController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    StorageUtil.getUid().then((uid) {
      _controller.uidSink.add(uid);
    });
  }

  @override
  Widget build(BuildContext context) {
    ConstScreen.setScreen(context);
    return Scaffold(
      backgroundColor: kColorWhite,
      key: widget._globalKey,
      appBar: AppBar(
        title: Text(
          'Bank Cards',
          style: kBoldTextStyle.copyWith(
            fontSize: FontSize.setTextSize(32),
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.edit),
            color: kColorBlack,
            iconSize: ConstScreen.setSizeWidth(35),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BankAccountAddingView()));
            },
          )
        ],
        backgroundColor: kColorWhite,
        iconTheme: IconThemeData.fallback(),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ConstScreen.setSizeWidth(30),
              vertical: ConstScreen.setSizeHeight(30)),
          child: StreamBuilder(
            stream: _controller.uidStream,
            builder: (context, mainSnapshot) {
              if (mainSnapshot.hasData) {
                return StreamBuilder<QuerySnapshot>(
                  stream: Firestore.instance
                      .collection('Cards')
                      .where('uid', isEqualTo: mainSnapshot.data)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData && mainSnapshot.hasData) {
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: kColorBlack),
                        child: ListView(
                          children: snapshot.data.documents
                              .map((DocumentSnapshot document) {
                            return Center(
                              child: Slidable(
                                actionPane: SlidableDrawerActionPane(),
                                actionExtentRatio: 0.25,
                                secondaryActions: <Widget>[
                                  IconSlideAction(
                                    caption: 'Delete',
                                    color: Colors.red,
                                    icon: Icons.delete,
                                    onTap: () {
                                      Firestore.instance
                                          .collection('Cards')
                                          .document(document.documentID)
                                          .delete();
                                    },
                                  ),
                                ],
                                child: CreditCardWidget(
                                  height: ConstScreen.setSizeHeight(380),
                                  width: ConstScreen.setSizeWidth(600),
                                  textStyle: TextStyle(
                                      fontSize: FontSize.setTextSize(34),
                                      color: kColorWhite,
                                      fontWeight: FontWeight.bold),
                                  cardNumber: document['cardNumber'],
                                  expiryDate:
                                      '${document['expiryMonth'].toString()} / ${document['expiryYear'].toString()}',
                                  cardHolderName: document['cardHolderName'],
                                  cvvCode: document['cvvCode'],
                                  showBackView: false,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
