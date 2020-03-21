import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:instacop/src/helpers/colors_constant.dart';
import 'package:instacop/src/helpers/screen.dart';

class DetailOfProductPage extends StatefulWidget {
  @override
  _DetailOfProductPageState createState() => _DetailOfProductPageState();
}

class _DetailOfProductPageState extends State<DetailOfProductPage> {
  @override
  Widget build(BuildContext context) {
    ConstScreen.setScreen(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: IconButton(
            color: kColorBlack,
            iconSize: ConstScreen.setSizeWidth(55),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: ConstScreen.setSizeWidth(40),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: 0, horizontal: ConstScreen.setSizeWidth(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Description:',
                style: TextStyle(
                    fontSize: FontSize.setTextSize(40),
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      left: ConstScreen.setSizeWidth(15),
                      top: ConstScreen.setSizeHeight(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Description
                      AutoSizeText(
                        'PacSun Exclusive! Add more stripes to your rotation courtesy of GUESS. The Hillshurt Logo Stripe T-Shirt has horizontal stripes all over and an embroidered GUESS logo at the center of the chest. PacSun Exclusive! Add more stripes to your rotation courtesy of GUESS. The Hillshurt Logo Stripe T-Shirt has horizontal stripes all over and an embroidered GUESS logo at the center of the chest.',
                        style: TextStyle(fontSize: 18),
                        minFontSize: 14,
                        maxLines: 15,
                        overflow: TextOverflow.ellipsis,
                      ),
                      // Made in
                      SizedBox(
                        height: ConstScreen.setSizeHeight(10),
                      ),
                      AutoSizeText(
                        'Brand: Supreme.\nMade in: Japan.',
                        style: TextStyle(fontSize: 18),
                        minFontSize: 14,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
