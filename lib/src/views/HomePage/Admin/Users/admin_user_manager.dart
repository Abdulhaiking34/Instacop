import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instacop/src/helpers/colors_constant.dart';
import 'package:instacop/src/helpers/screen.dart';
import 'package:instacop/src/widgets/widget_title.dart';
import 'package:intl/intl.dart';

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
                  DateTime createAt = new DateFormat("yyyy-MM-dd hh:mm:ss")
                      .parse(document['create_at']);
                  var formatter = new DateFormat('dd-MM-yyyy');
                  index++;
                  return UserInfoCard(
                      id: index.toString(),
                      username: document['username'],
                      fullname: document['fullname'],
                      phone: document['phone'],
                      createAt: formatter.format(createAt));
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
