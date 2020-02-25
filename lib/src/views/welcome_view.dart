import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instacop/src/widgets/button_tap.dart';
import 'package:instacop/src/widgets/icon_instacop.dart';

import '../../link.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imageAddress + 'welcome_wall.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(.3),
                  Colors.black.withOpacity(.1),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                    flex: 8,
                    child: IconInstacop(
                      textSize: 60,
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  new ButtonTap(
                    text: 'Sign Up / Sign In',
                    isSelected: true,
                    function: () {
                      Navigator.pushNamed(context, 'register_screen');
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  new ButtonTap(
                    text: "Start Browsing",
                    isSelected: false,
                    function: () {},
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
