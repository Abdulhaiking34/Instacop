import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instacop/src/helpers/colors_constant.dart';
import 'package:instacop/src/helpers/screen.dart';
import 'package:instacop/src/model/product.dart';
import 'package:instacop/src/views/HomePage/Customer/HomePage/ProductDetail/detail_product_page.dart';
import 'package:instacop/src/views/HomePage/Customer/HomePage/ProductDetail/ProductPage/product_page.dart';
import 'package:instacop/src/views/HomePage/Customer/HomePage/ProductDetail/rating_product_page.dart';

class MainDetailProductView extends StatefulWidget {
  MainDetailProductView({this.product});
  final Product product;
  @override
  _MainDetailProductViewState createState() => _MainDetailProductViewState();
}

class _MainDetailProductViewState extends State<MainDetailProductView> {
  Product product;
  List<Widget> pages = [];
  final PageStorageBucket bucket = PageStorageBucket();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    product = widget.product;
    List<Widget> pages = [
      ProductPage(
        product: product,
        key: PageStorageKey('Page0'),
      ),
      DetailOfProductPage(
        product: product,
        key: PageStorageKey('Page1'),
      ),
      RatingProductPage(
        product: widget.product,
        key: PageStorageKey('Page2'),
      )
    ];
  }

  void onTap(int index) {
    pageController.jumpToPage(index);
  }

  final pageController = PageController();
  int indexPage = 1;
  @override
  Widget build(BuildContext context) {
    ConstScreen.setScreen(context);

    return Scaffold(
      body: SafeArea(
          child: PageStorage(
        child: PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              indexPage = index;
            });
          },
          children: <Widget>[
            ProductPage(
              product: product,
            ),
            DetailOfProductPage(
              product: product,
            ),
            RatingProductPage(
              product: widget.product,
            )
          ],
        ),
        bucket: bucket,
      )),
      bottomNavigationBar: SizedBox(
        height: ConstScreen.setSizeHeight(115),
        child: BottomNavigationBar(
          onTap: onTap,
          currentIndex: indexPage,
          unselectedFontSize: FontSize.s25,
          selectedFontSize: FontSize.s28,
          selectedItemColor: kColorBlack,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          iconSize: ConstScreen.setSizeHeight(0.1),
          items: const [
            BottomNavigationBarItem(
                title: Text('Product'), icon: Icon(Icons.rate_review)),
            BottomNavigationBarItem(
                title: Text('Detail'), icon: Icon(Icons.rate_review)),
            BottomNavigationBarItem(
                title: Text('Rating'), icon: Icon(Icons.rate_review)),
          ],
        ),
      ),
    );
  }
}
