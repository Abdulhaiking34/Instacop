import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:instacop/src/helpers/colors_constant.dart';
import 'package:instacop/src/helpers/screen.dart';
import 'package:instacop/src/widgets/category_item.dart';

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    ConstScreen.setScreen(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        // TODO: Search Bar
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: kColorBlack.withOpacity(0.6),
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: ConstScreen.setSizeHeight(15),
                  horizontal: ConstScreen.setSizeWidth(20)),
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: kColorBlack.withOpacity(0.6),
                    ),
                  ),
                  hintText: 'SEARCH',
                  hintStyle: TextStyle(
                      fontSize: FontSize.s30,
                      color: kColorBlack,
                      fontWeight: FontWeight.bold),
                  // TODO: Search Button
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.search,
                      color: kColorBlack.withOpacity(0.8),
                      size: ConstScreen.setSizeWidth(45),
                    ),
                    onPressed: () {},
                  ),
                ),
                style: TextStyle(fontSize: FontSize.s30, color: kColorBlack),
                maxLines: 1,
                onChanged: (value) {},
              ),
            ),
          ),
        ),
        //TODO: Category
        Expanded(
          flex: 9,
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              ExpansionTile(
                title: Text('Clothing',
                    style: TextStyle(
                        fontSize: FontSize.setTextSize(34),
                        fontWeight: FontWeight.w400)),
                children: <Widget>[
                  CategoryItem(
                    title: 'Demin',
                  ),
                  CategoryItem(
                    title: 'Coats',
                  ),
                  CategoryItem(
                    title: 'Jacket',
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  'Sale',
                  style: TextStyle(
                      fontSize: FontSize.setTextSize(34),
                      color: kColorRed,
                      fontWeight: FontWeight.w400),
                ),
                children: <Widget>[
                  CategoryItem(
                    title: 'Demin',
                  ),
                  CategoryItem(
                    title: 'Coats',
                  ),
                  CategoryItem(
                    title: 'Jacket',
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
