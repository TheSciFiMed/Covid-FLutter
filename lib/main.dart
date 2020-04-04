import 'package:covidapp/pages/Help.dart';
import 'package:covidapp/pages/home.dart';
import 'package:covidapp/pages/login.dart';
import 'package:covidapp/pages/register.dart';
import 'package:covidapp/pages/register2.dart';
import 'package:covidapp/pages/welcome.dart';
import 'package:covidapp/scoped-models/main.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isAuthenticated = true;
  final MainModel _model = MainModel();
  @override
  void initState() {
    // _isAuthenticated = _model.isAuthenticated;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: _model,
      child: MaterialApp(
        title: 'COVID APP',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Color(0XFFEFF3F6),
        ),
        home: SecondRegisterPage(),
        // routes: {
        //   '/': (BuildContext context) =>
        //       _isAuthenticated ? Homepage() : WelcomePage(),
        //   '/homepage': (BuildContext context) => Homepage(),
        //   '/login': (BuildContext context) => LoginPage(),
        //   '/help': (BuildContext context) => HelpPage(),
        //   '/register': (BuildContext context) => Registrationpage(),
        // },
      ),
    );
  }
}
