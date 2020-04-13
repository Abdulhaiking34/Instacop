import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:instacop/src/helpers/colors_constant.dart';
import 'package:instacop/src/helpers/screen.dart';

class RatingComment extends StatelessWidget {
  RatingComment({this.username = '', this.comment = '', this.ratingPoint = 0});
  final String comment;
  final String username;
  final double ratingPoint;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
            border: Border(
          top: BorderSide(color: kColorBlack.withOpacity(0.2), width: 1),
          bottom: BorderSide(color: kColorBlack.withOpacity(0.2), width: 1),
        )),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: ConstScreen.setSizeWidth(5),
              horizontal: ConstScreen.setSizeWidth(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //TODO: Username + RatingBar
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  AutoSizeText(
                    username,
                    style: TextStyle(
                        fontSize: FontSize.s25, fontWeight: FontWeight.bold),
                    maxLines: 1,
                    minFontSize: 14,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    width: ConstScreen.setSizeWidth(20),
                  ),
                  RatingBar(
                    allowHalfRating: true,
                    initialRating: ratingPoint,
                    itemCount: 5,
                    minRating: 0,
                    itemSize: ConstScreen.setSizeHeight(35),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amberAccent,
                    ),
                  )
                ],
              ),
              // Comment
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: ConstScreen.setSizeHeight(5),
                    horizontal: ConstScreen.setSizeWidth(8)),
                child: AutoSizeText(
                  comment,
                  minFontSize: 14,
                  style: TextStyle(fontSize: FontSize.s23),
                  maxLines: 100,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
