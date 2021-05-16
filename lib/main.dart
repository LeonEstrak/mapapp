import 'package:flutter/material.dart';
import 'package:mapapp/Authentication/LoginPage.dart';
import 'package:mapapp/Authentication/RegistrationPage.dart';
import 'package:mapapp/Home/HomePage.dart';
import 'package:mapapp/Home/MapPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(scaffoldBackgroundColor: Colors.blue[100]),
      initialRoute: "/login",
      routes: {
        "/": (context) => HomePage(),
        "/login": (context) => LoginPage(),
        "/registration": (context) => RegistrationPage(),
        "/map": (context) => MapPage(),
        // "/vehicles":Vehicles(),
      },
    );
  }
}
