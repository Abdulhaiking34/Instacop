import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instacop/src/helpers/screen.dart';
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
      if (onValue) {
        Navigator.pushNamed(context, 'welcome_screen');
      }
    });
  }

  Future<bool> delay() async {
    await Future.delayed(Duration(seconds: 3));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, height: 1334, width: 750);
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
