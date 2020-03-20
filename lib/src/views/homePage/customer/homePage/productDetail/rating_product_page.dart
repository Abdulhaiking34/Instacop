import 'package:flutter/material.dart';
import 'package:instacop/src/helpers/screen.dart';

class RatingProductPage extends StatefulWidget {
  @override
  _RatingProductPageState createState() => _RatingProductPageState();
}

class _RatingProductPageState extends State<RatingProductPage> {
  @override
  Widget build(BuildContext context) {
    ConstScreen.setScreen(context);
    return Container();
  }
}

//RatingBar(
//allowHalfRating: true,
//initialRating: ratingValue,
//itemCount: 5,
//minRating: 0,
//itemSize: ConstScreen.setSizeHeight(55),
//itemBuilder: (context, _) => Icon(
//Icons.star,
//color: Colors.amberAccent,
//),
//onRatingUpdate: (rating) {
//ratingValue = rating;
//},
//),
