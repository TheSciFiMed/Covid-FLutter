import 'package:covidapp/pages/auth.dart';
import 'package:covidapp/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool _isAuthenticated = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'COVID APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color(0XFFEFF3F6),
      ),
      routes: {
        '/': (BuildContext context) =>
            _isAuthenticated ? Homepage() : Authpage(),
      },
    );
  }
}
