import 'package:flutter/material.dart';
import 'package:instacop/src/helpers/screen.dart';
import 'package:instacop/src/helpers/shared_preferrence.dart';
import 'package:instacop/src/widgets/icon_instacop.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    delay().then((onValue) {
      if (onValue == '') {
        Navigator.pushNamed(context, 'welcome_screen');
      }
    });
  }

  Future<String> delay() async {
    await Future.delayed(Duration(seconds: 3));
//    try {
//      StorageUtil.getIsLogging().then((islogging) {
//        if (islogging) {
//          print(islogging);
//        StorageUtil.getAccountType().then((accountType) {
//          if (accountType == 'admin') {
//            print('admin');
////            Navigator.pushNamed(context, 'admin_home_screen');
//          } else if (accountType == 'customer') {
//            print('customer');
////            Navigator.pushNamed(context, 'customer_home_screen');
//          }
//        });
//      } else {
//        print('geust');
////        Navigator.pushNamed(context, 'welcome_screen');
//        }
//      });
//    } catch (e) {}
    return '';
  }

  @override
  Widget build(BuildContext context) {
    ConstScreen.setScreen(context);
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          color: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new IconInstacop(
                textSize: FontSize.setTextSize(80),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
