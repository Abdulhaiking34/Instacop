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
              //TODO: Clothing
              ExpansionTile(
                title: Text('CLOTHING',
                    style: TextStyle(
                        fontSize: FontSize.setTextSize(32),
                        fontWeight: FontWeight.w400)),
                children: <Widget>[
                  CategoryItem(
                    title: 'Hoodies & Sweatshirts',
                    onTap: () {},
                  ),
                  CategoryItem(
                    title: 'Shirts',
                    onTap: () {},
                  ),
                  CategoryItem(
                    title: 'Jacket',
                    onTap: () {},
                  ),
                  CategoryItem(
                    title: 'Shorts',
                    onTap: () {},
                  ),
                  CategoryItem(
                    title: 'Pants',
                    onTap: () {},
                  ),
                  CategoryItem(
                    title: 'Jeans',
                    onTap: () {},
                  ),
                  CategoryItem(
                    title: 'Joggers',
                    onTap: () {},
                  ),
                ],
              ),
              //TODO: Shoes
              ExpansionTile(
                title: Text(
                  'SHOES',
                  style: TextStyle(
                      fontSize: FontSize.setTextSize(32),
                      color: kColorBlack,
                      fontWeight: FontWeight.w400),
                ),
                children: <Widget>[
                  CategoryItem(
                    title: 'Athletic Shoes',
                    onTap: () {},
                  ),
                  CategoryItem(
                    title: 'Causual Shoes',
                    onTap: () {},
                  ),
                  CategoryItem(
                    title: 'Sandals & Slides',
                    onTap: () {},
                  )
                ],
              ),
              //TODO: Accessories
              ExpansionTile(
                title: Text(
                  'ACCESSORIES',
                  style: TextStyle(
                      fontSize: FontSize.setTextSize(32),
                      color: kColorBlack,
                      fontWeight: FontWeight.w400),
                ),
                children: <Widget>[
                  CategoryItem(
                    title: 'Hats',
                    onTap: () {},
                  ),
                  CategoryItem(
                    title: 'Backpacks',
                    onTap: () {},
                  ),
                  CategoryItem(
                    title: 'Sunglasses',
                    onTap: () {},
                  ),
                  CategoryItem(
                    title: 'Belts',
                    onTap: () {},
                  ),
                  CategoryItem(
                    title: 'Watches',
                    onTap: () {},
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
