import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instacop/src/helpers/TextStyle.dart';
import 'package:instacop/src/helpers/colors_constant.dart';
import 'package:instacop/src/helpers/screen.dart';
import 'package:instacop/src/helpers/utils.dart';
import 'package:instacop/src/model/coupon.dart';
import 'package:instacop/src/views/HomePage/Admin/Users/admin_adding_account.dart';
import 'package:instacop/src/views/HomePage/Admin/Users/admin_coupon_controller.dart';
import 'package:instacop/src/views/HomePage/Customer/chat_view.dart';
import 'package:instacop/src/widgets/button_raised.dart';
import 'package:instacop/src/widgets/input_text.dart';
import 'package:instacop/src/widgets/widget_title.dart';

class UserManagerView extends StatefulWidget {
  @override
  _UserManagerViewState createState() => _UserManagerViewState();
}

class _UserManagerViewState extends State<UserManagerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData.fallback(),
        backgroundColor: kColorWhite,
        // TODO: Quantity Items
        title: Text(
          'User List',
          style: TextStyle(
              color: kColorBlack,
              fontSize: FontSize.setTextSize(32),
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.add_comment,
                size: ConstScreen.setSizeWidth(45),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AdminAddingAccount()));
              })
        ],
      ),
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('Users').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              int index = 0;
              return ListView(
                children:
                    snapshot.data.documents.map((DocumentSnapshot document) {
                  index++;
                  return Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    actionExtentRatio: 0.25,
                    secondaryActions: <Widget>[
                      IconSlideAction(
                        caption: 'Coupon',
                        color: kColorOrange,
                        icon: FontAwesomeIcons.ticketAlt,
                        onTap: () {
                          Coupon coupon = new Coupon();
                          DateTime expiredDate;
                          CouponController couponController =
                              new CouponController();
                          TextEditingController discountTextController =
                              new TextEditingController();
                          TextEditingController billingAmountTextController =
                              new TextEditingController();
                          //TODO: sent Coupon
                          showDialog(
                              context: context,
                              child: Dialog(
                                child: Container(
                                  height: ConstScreen.setSizeHeight(620),
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                        ConstScreen.setSizeHeight(10)),
                                    child: Column(
                                      children: <Widget>[
                                        //TODO: Tittle
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical:
                                                  ConstScreen.setSizeHeight(
                                                      25)),
                                          child: Text(
                                            'Coupon',
                                            style: kBoldTextStyle.copyWith(
                                                fontSize:
                                                    FontSize.setTextSize(45)),
                                          ),
                                        ),
                                        //TODO: Discount
                                        StreamBuilder(
                                            stream:
                                                couponController.discountStream,
                                            builder: (context, snapshot) {
                                              return InputText(
                                                title: 'Discount',
                                                controller:
                                                    discountTextController,
                                                errorText: snapshot.hasError
                                                    ? snapshot.error
                                                    : null,
                                                inputType: TextInputType.number,
                                                hintText: '50%',
                                              );
                                            }),
                                        SizedBox(
                                          height: ConstScreen.setSizeHeight(15),
                                        ),
                                        //TODO: Max discount price
                                        StreamBuilder(
                                            stream: couponController
                                                .billingAmountStream,
                                            builder: (context, snapshot) {
                                              return InputText(
                                                title: 'Billing Amount',
                                                controller:
                                                    billingAmountTextController,
                                                errorText: snapshot.hasError
                                                    ? snapshot.error
                                                    : null,
                                                inputType: TextInputType.number,
                                                hintText: '100,000',
                                              );
                                            }),
                                        SizedBox(
                                          height: ConstScreen.setSizeHeight(30),
                                        ),
                                        //TODO: Date time picker
                                        FlatButton(
                                          onPressed: () {
                                            DatePicker.showDatePicker(context,
                                                showTitleActions: true,
                                                minTime: DateTime(
                                                    DateTime.now().year,
                                                    DateTime.now().month,
                                                    DateTime.now().day),
                                                maxTime: DateTime(
                                                    DateTime.now().year + 50,
                                                    12,
                                                    31), onChanged: (date) {
                                              expiredDate = date;
                                            }, onConfirm: (date) {
                                              expiredDate = date;
                                              coupon.expiredDate =
                                                  date.toString();
                                              couponController.expiredDateSink
                                                  .add(true);
                                            },
                                                currentTime: DateTime.now(),
                                                locale: LocaleType.vi);
                                          },
                                          child: Container(
                                            height:
                                                ConstScreen.setSizeHeight(80),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: kColorBlack
                                                        .withOpacity(0.7))),
                                            child: Center(
                                              child: StreamBuilder(
                                                  stream: couponController
                                                      .expiredDateStream,
                                                  builder: (context, snapshot) {
                                                    return snapshot.hasError
                                                        ? Text(
                                                            snapshot.error,
                                                            style: TextStyle(
                                                                color:
                                                                    kColorRed,
                                                                fontSize:
                                                                    FontSize
                                                                        .s30,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          )
                                                        : Text(
                                                            snapshot.hasData
                                                                ? ('Expired Date: ' +
                                                                    expiredDate
                                                                        .day
                                                                        .toString() +
                                                                    '/' +
                                                                    expiredDate
                                                                        .month
                                                                        .toString() +
                                                                    '/' +
                                                                    expiredDate
                                                                        .year
                                                                        .toString())
                                                                : 'Expired Date Picker',
                                                            style: TextStyle(
                                                                color:
                                                                    kColorBlack,
                                                                fontSize:
                                                                    FontSize
                                                                        .s30,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          );
                                                  }),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: ConstScreen.setSizeHeight(30),
                                        ),
                                        //TODO: button
                                        Row(
                                          children: <Widget>[
                                            Expanded(
                                              flex: 1,
                                              child: CusRaisedButton(
                                                title: 'CREATE',
                                                backgroundColor: kColorBlack,
                                                onPress: () {
                                                  coupon.discount =
                                                      discountTextController
                                                          .text;

                                                  coupon.maxBillingAmount =
                                                      billingAmountTextController
                                                          .text;
                                                  coupon.uid =
                                                      document.documentID;
                                                  coupon.couponKey =
                                                      Coupon.randomCouponKey(
                                                          10);
                                                  coupon.createAt =
                                                      DateTime.now().toString();
                                                  var result = couponController
                                                      .onCreateCoupon(coupon);
                                                  if (result == 0)
                                                    Navigator.pop(context);
                                                },
                                              ),
                                            ),
                                            SizedBox(
                                              width:
                                                  ConstScreen.setSizeHeight(20),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: CusRaisedButton(
                                                title: 'CANCEL',
                                                backgroundColor:
                                                    kColorLightGrey,
                                                onPress: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ));
                        },
                      ),
                      IconSlideAction(
                        caption: 'Chat',
                        color: kColorBlue,
                        icon: Icons.chat,
                        onTap: () {
                          //TODO: CHAT
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChatScreen(
                                        isAdmin: true,
                                        uidCustomer: document.documentID,
                                      )));
                        },
                      ),
                    ],
                    child: UserInfoCard(
                        id: index.toString(),
                        username: document['username'],
                        fullname: document['fullname'],
                        phone: document['phone'],
                        isAdmin: document['type'] == 'admin',
                        createAt: Util.convertDateToFullString(
                            document['create_at'])),
                  );
                }).toList(),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

class UserInfoCard extends StatelessWidget {
  const UserInfoCard({
    Key key,
    this.id,
    this.isAdmin = false,
    this.username = '',
    this.fullname = '',
    this.phone = '',
    this.createAt = '',
  }) : super(key: key);
  final String id;
  final String fullname;
  final String username;
  final String phone;
  final String createAt;
  final bool isAdmin;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: ConstScreen.setSizeHeight(5),
          horizontal: ConstScreen.setSizeWidth(10)),
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: ConstScreen.setSizeHeight(10),
              horizontal: ConstScreen.setSizeWidth(10)),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                color: isAdmin ? Colors.red[200] : Colors.lightBlueAccent,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: ConstScreen.setSizeHeight(10)),
                    child: Text(
                      isAdmin ? 'ADMIN' : 'CUSTOMER',
                      style: kBoldTextStyle.copyWith(
                        fontSize: FontSize.setTextSize(32),
                        color: kColorWhite,
                      ),
                    ),
                  ),
                ),
              ),
              //TODO: id
              TitleWidget(
                title: 'ID',
                content: id,
                isSpaceBetween: false,
              ),
              //TODO: Username
              TitleWidget(
                title: 'Username',
                content: username,
                isSpaceBetween: false,
              ),
              //TODO: full name
              TitleWidget(
                title: 'Full name',
                content: fullname,
                isSpaceBetween: false,
              ),
              //TODO: phone number
              TitleWidget(
                title: 'Phone number',
                content: phone,
                isSpaceBetween: false,
              ),
              //TODO: Create at
              TitleWidget(
                title: 'Create at',
                content: createAt,
                isSpaceBetween: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
