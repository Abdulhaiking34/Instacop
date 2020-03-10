import 'package:flutter/material.dart';

class WishListView extends StatefulWidget {
  @override
  _WishListViewState createState() => _WishListViewState();
}

class _WishListViewState extends State<WishListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.tealAccent,
      child: Text('Wishlist', style: TextStyle(fontSize: 50)),
    );
  }
}
