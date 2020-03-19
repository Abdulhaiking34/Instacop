import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:instacop/routes.dart';
import 'package:instacop/src/helpers/screen.dart';

void main() => runApp(
      DevicePreview(
        builder: (context) => MyApp(),
      ),
    );

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.of(context).locale,
      builder: DevicePreview.appBuilder,
      initialRoute: initialRoute,
      routes: routes,
    );
  }
}
