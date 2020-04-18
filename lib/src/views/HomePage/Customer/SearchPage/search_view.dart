import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:instacop/src/helpers/colors_constant.dart';
import 'package:instacop/src/helpers/screen.dart';
import 'package:instacop/src/views/HomePage/Customer/HomePage/product_list_view.dart';
import 'package:instacop/src/widgets/category_item.dart';

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView>
    with AutomaticKeepAliveClientMixin {
  void navigatorTo(String link) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProductListView(
                  search: link,
                )));
  }

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
                    title: 'Tees',
                    onTap: () {
                      navigatorTo('Tees');
                    },
                  ),
                  CategoryItem(
                    title: 'Hoodies & Sweatshirts',
                    onTap: () {
                      navigatorTo('Hoodies & Sweatshirts');
                    },
                  ),
                  CategoryItem(
                    title: 'Shirts',
                    onTap: () {
                      navigatorTo('Shirts');
                    },
                  ),
                  CategoryItem(
                    title: 'Jacket',
                    onTap: () {
                      navigatorTo('Jacket');
                    },
                  ),
                  CategoryItem(
                    title: 'Shorts',
                    onTap: () {
                      navigatorTo('Shorts');
                    },
                  ),
                  CategoryItem(
                    title: 'Pants',
                    onTap: () {
                      navigatorTo('Pants');
                    },
                  ),
                  CategoryItem(
                    title: 'Sweatpants',
                    onTap: () {
                      navigatorTo('Sweatpants');
                    },
                  ),
                  CategoryItem(
                    title: 'Jeans',
                    onTap: () {
                      navigatorTo('Jeans');
                    },
                  ),
                  CategoryItem(
                    title: 'Joggers',
                    onTap: () {
                      navigatorTo('Joggers');
                    },
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
                    onTap: () {
                      navigatorTo('Athletic Shoes');
                    },
                  ),
                  CategoryItem(
                    title: 'Causual Shoes',
                    onTap: () {
                      navigatorTo('Causual Shoes');
                    },
                  ),
                  CategoryItem(
                    title: 'Sandals & Slides',
                    onTap: () {
                      navigatorTo('Sandals & Slides');
                    },
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
                    onTap: () {
                      navigatorTo('Hats');
                    },
                  ),
                  CategoryItem(
                    title: 'Backpacks',
                    onTap: () {
                      navigatorTo('Backpacks');
                    },
                  ),
                  CategoryItem(
                    title: 'Sunglasses',
                    onTap: () {
                      navigatorTo('Sunglasses');
                    },
                  ),
                  CategoryItem(
                    title: 'Belts',
                    onTap: () {
                      navigatorTo('Belts');
                    },
                  ),
                  CategoryItem(
                    title: 'Watches',
                    onTap: () {
                      navigatorTo('Watches');
                    },
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
