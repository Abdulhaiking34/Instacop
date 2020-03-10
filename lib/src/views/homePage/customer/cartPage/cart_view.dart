import 'package:flutter/material.dart';
import 'package:instacop/src/widgets/icon_instacop.dart';

class CartView extends StatefulWidget {
  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.green,
          child: Text('Cart', style: TextStyle(fontSize: 50)),
        ),
      ),
    );
  }
}
