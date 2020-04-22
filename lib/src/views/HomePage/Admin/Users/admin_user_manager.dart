import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:instacop/src/helpers/colors_constant.dart';
import 'package:instacop/src/helpers/screen.dart';
import 'package:instacop/src/helpers/utils.dart';
import 'package:instacop/src/views/HomePage/Admin/Users/admin_adding_account.dart';
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
                        caption: 'Delete',
                        color: Colors.red,
                        icon: Icons.delete,
                        onTap: () {
                          Firestore.instance
                              .collection('Users')
                              .document(document.documentID)
                              .delete();
                        },
                      ),
                    ],
                    child: UserInfoCard(
                        id: index.toString(),
                        username: document['username'],
                        fullname: document['fullname'],
                        phone: document['phone'],
                        type: document['type'],
                        createAt:
                            Util.convertDateToString(document['create_at'])),
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
  const UserInfoCard(
      {Key key,
      this.id,
      this.username = '',
      this.fullname = '',
      this.phone = '',
      this.createAt = '',
      this.type})
      : super(key: key);
  final String id;
  final String fullname;
  final String username;
  final String phone;
  final String createAt;
  final String type;
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
              //TODO: id
              TitleWidget(
                title: 'Type',
                content: type,
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
