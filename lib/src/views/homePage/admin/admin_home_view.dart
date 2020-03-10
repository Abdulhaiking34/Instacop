import 'package:flutter/material.dart';
import 'package:instacop/src/helpers/colors_constant.dart';
import 'package:instacop/src/widgets/icon_instacop.dart';

class AdminHomeView extends StatefulWidget {
  @override
  _AdminHomeViewState createState() => _AdminHomeViewState();
}

class _AdminHomeViewState extends State<AdminHomeView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kColorBlack,
      child: IconInstacop(
        textSize: 50,
      ),
    );
  }
}
