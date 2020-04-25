import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instacop/src/helpers/chat_const.dart';
import 'package:instacop/src/helpers/colors_constant.dart';
import 'package:instacop/src/helpers/screen.dart';
import 'package:instacop/src/helpers/shared_preferrence.dart';
import 'package:instacop/src/widgets/message_bubble.dart';

FirebaseUser loggedInUser;

class ChatScreen extends StatefulWidget {
  ChatScreen({this.isAdmin = false, this.uidCustomer = ''});
  final bool isAdmin;
  final String uidCustomer;
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>
    with AutomaticKeepAliveClientMixin {
  final messageTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  List<MessageBubble> messageBubbles = [];
  String messageText;
  String uid = '';
  StreamController _controller = new StreamController();

  void dispose() {
    super.dispose();
    _controller.close();
  }

  @override
  void initState() {
    super.initState();
    if (widget.isAdmin) {
      uid = widget.uidCustomer;
      _controller.sink.add(widget.uidCustomer);
    } else {
      StorageUtil.getUid().then((uid) {
        _controller.sink.add(uid);
        this.uid = uid;
      });
    }
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    ConstScreen.setScreen(context);
    return Scaffold(
      appBar: widget.isAdmin
          ? AppBar(
              backgroundColor: kColorWhite,
              iconTheme: IconThemeData.fallback(),
              title: Text(
                'Chat',
                style: TextStyle(
                    color: kColorBlack,
                    fontSize: FontSize.setTextSize(32),
                    fontWeight: FontWeight.w500),
              ),
              centerTitle: true,
            )
          : null,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder(
              stream: _controller.stream,
              builder: (context, mainSnapshot) {
                if (mainSnapshot.hasData) {
                  return StreamBuilder<QuerySnapshot>(
                    stream: Firestore.instance
                        .collection('Chat')
                        .document(mainSnapshot.data)
                        .collection(mainSnapshot.data)
                        .orderBy('timestamp')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData || !mainSnapshot.hasData) {
                        return Container();
                      }
                      final messages = snapshot.data.documents.reversed;
                      messageBubbles = [];
                      for (var message in messages) {
                        final messageText = message.data['text'];
                        final messageSender = message.data['sender'];

                        final currentUser = loggedInUser.email;

                        final messageBubble = MessageBubble(
                          sender: messageSender,
                          text: messageText,
                          isMe: currentUser == messageSender,
                        );

                        messageBubbles.add(messageBubble);
                      }
                      return Expanded(
                        child: ListView(
                          reverse: true,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 20.0),
                          children: messageBubbles,
                        ),
                      );
                    },
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  //TODO: sent message
                  FlatButton(
                    onPressed: () {
                      messageTextController.clear();
                      Firestore.instance
                          .collection('Chat')
                          .document(uid)
                          .collection(uid)
                          .add({
                        'roomId': uid,
                        'text': messageText,
                        'sender': loggedInUser.email,
                        'timestamp':
                            DateTime.now().toUtc().millisecondsSinceEpoch
                      });
                      setState(() {
                        messageBubbles.add(MessageBubble(
                          sender: loggedInUser.email,
                          text: messageText,
                          isMe: true,
                        ));
                      });
                    },
                    child: Text(
                      'Send',
                      style:
                          kSendButtonTextStyle.copyWith(fontSize: FontSize.s36),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
