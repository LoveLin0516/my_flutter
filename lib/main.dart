import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_flutter/FirstRoute.dart';
import 'package:my_flutter/SecondRoute.dart';
import 'package:my_flutter/TestLayout1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _widgetForRoute(window.defaultRouteName),
    );
  }

  Widget _widgetForRoute(String route) {
    switch (route) {
      case 'route1':
        return FirstRoute();
      case 'route2':
        return SecondRoute();
      default:
        return TestLayout1();
//        return Center(
//          child: Text(
//              'Unknown route: $route', textDirection: TextDirection.ltr),
//        );
    }
  }

}

