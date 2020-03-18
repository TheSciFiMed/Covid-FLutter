import 'dart:math';

import 'package:covidapp/animated/waves.dart';
import 'package:covidapp/mytxtfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    onBottom(Widget child) => Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: child,
          ),
        );
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              // color: Colors.white,
            ),
            Align(
              child: Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "GO CORONA",
                      style: GoogleFonts.offside(fontSize: 30),
                    ),
                    Text("An initiative to minimize Covid-19")
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MyTextField(
                  icon: Icons.email,
                  label: "Email",
                  hinttext: "Enter your Email here",
                ),
                MyTextField(
                  icon: Icons.account_circle,
                  label: "Password",
                  hinttext: "Enter your Password here...",
                ),
                SizedBox(
                  height: 20,
                ),
                CupertinoButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/homepage');
                  },
                  child: Text("LOGIN"),
                  color: Colors.grey.shade400,
                )
              ],
            ),
            onBottom(AnimatedWave(
              height: 100,
              speed: 1.0,
              color: Colors.black,
            )),
            onBottom(AnimatedWave(
              height: 120,
              speed: 0.9,
              offset: pi,
              color: Colors.black,
            )),
            onBottom(AnimatedWave(
              height: 220,
              speed: 1.2,
              offset: pi / 2,
              color: Colors.black,
            ))
          ],
        ),
      ),
    );
  }
}
