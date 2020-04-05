import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instacop/src/helpers/TextStyle.dart';
import 'package:instacop/src/helpers/colors_constant.dart';
import 'package:instacop/src/helpers/screen.dart';
import 'package:instacop/src/helpers/shared_preferrence.dart';
import 'package:instacop/src/views/homePage/customer/homePage/cus_home_view.dart';
import 'package:instacop/src/views/homePage/customer/profilePage/profile_view.dart';
import 'package:instacop/src/views/homePage/customer/searchPage/search_view.dart';
import 'package:instacop/src/views/homePage/customer/wishlistPage/wishlist_view.dart';

class CustomerHomeView extends StatefulWidget {
  @override
  _CustomerHomeViewState createState() => _CustomerHomeViewState();
}

class _CustomerHomeViewState extends State<CustomerHomeView> {
  final tabsScreen = [
    CustomerHomePageView(),
    SearchView(),
    WishListView(),
    ProfileView(),
  ];
  final tabsTitle = [' ', 'Search', 'Wishlist', 'Profile'];
  int indexScreen = 0;
  bool _isLogging;

  @override
  initState() {
    // TODO: implement initState
    StorageUtil.getIsLogging().then((bool value) {
      if (value != null) {
        _isLogging = value;
      } else {
        _isLogging = false;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ConstScreen.setScreen(context);
    return Scaffold(
      appBar: (indexScreen > 1)
          ? AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: kColorWhite,
              iconTheme: IconThemeData.fallback(),
              title: Text(
                tabsTitle[indexScreen],
                style:
                    kBoldTextStyle.copyWith(fontSize: FontSize.setTextSize(32)),
              ),
              centerTitle: true,
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.shoppingBag,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, 'customer_cart_page');
                  },
                ),
              ],
            )
          : null,
      body: SafeArea(child: tabsScreen[indexScreen]),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey.shade500,
        selectedFontSize: 1,
        unselectedFontSize: 1,
        selectedItemColor: kColorBlack,
        currentIndex: indexScreen,
        onTap: (index) {
          print('onTap ' + _isLogging.toString());
          if (_isLogging == false && index > 1) {
            Navigator.pushNamed(context, 'register_screen');
          } else {
            setState(() {
              indexScreen = index;
            });
          }
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: ConstScreen.sizeXXL,
              ),
              title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.search,
                size: ConstScreen.sizeXL,
              ),
              title: Text('Search')),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                size: ConstScreen.sizeXL,
              ),
              title: Text('Wishlist')),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.userAlt,
                size: ConstScreen.sizeXL,
              ),
              title: Text('Profile')),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
