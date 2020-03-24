import 'package:flutter/material.dart';
import 'package:instacop/src/helpers/screen.dart';
import 'package:instacop/src/widgets/card_product.dart';

class WishListView extends StatefulWidget {
  @override
  _WishListViewState createState() => _WishListViewState();
}

class _WishListViewState extends State<WishListView> {
  @override
  Widget build(BuildContext context) {
    ConstScreen.setScreen(context);
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: ConstScreen.setSizeHeight(30),
          horizontal: ConstScreen.setSizeWidth(20)),
      child: GridView.count(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        crossAxisCount: 2,
        crossAxisSpacing: ConstScreen.setSizeHeight(30),
        mainAxisSpacing: ConstScreen.setSizeHeight(40),
        childAspectRatio: 70 / 110,
        children: <Widget>[
          ProductCard(
            productName: 'Hoodies COR Hoodies COR Hoodies CORHoodies COR',
            image: 'hoodie_1.jpg',
            price: 10000000,
            salePrice: 9999999,
            isIconClose: true,
            onClosePress: () {},
          ),
          ProductCard(
            productName: 'Hoodies COR',
            image: 'hoodie_1.jpg',
            price: 100000,
            salePrice: 0,
            isIconClose: true,
            onClosePress: () {},
          ),
          ProductCard(
            productName: 'Hoodies COR',
            image: 'hoodie_1.jpg',
            price: 100000,
            salePrice: 9999,
            isIconClose: true,
            onClosePress: () {},
          ),
        ],
      ),
    );
  }
}
