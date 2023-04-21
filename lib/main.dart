import 'package:flutter/material.dart';
import 'package:navigation/screen/home_screen.dart';
import 'package:navigation/screen/route_one_screen.dart';
import 'package:navigation/screen/route_three_screen.dart';
import 'package:navigation/screen/route_two_screen.dart';

// 이렇게 쓰면 오타로 인한 오류 줄일 수 있음
const HOME_ROUTE = '/';

void main() {
  runApp(MaterialApp(
    // home: HomeScreen(),
    initialRoute: '/',
    // www.google.com -> www.google.com/
    routes: {
      HOME_ROUTE: (context) => HomeScreen(),
      '/one': (context) => RouteOneScreen(),
      '/two': (context) => RouteTwoScreen(),
      '/three': (context) => RouteThreeScreen(),
    },
  ));
}
