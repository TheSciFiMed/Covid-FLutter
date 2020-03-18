import 'dart:math';

import 'package:covidapp/animated/waves.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    onBottom(Widget child) => Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: child,
          ),
        );
    return Scaffold(
      backgroundColor: Colors.white,
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
                      style:
                          GoogleFonts.offside(fontSize: 30, color: Colors.grey),
                    ),
                    Text(
                      "An initiative to minimize Covid-19",
                      style: TextStyle(),
                    )
                  ],
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.width * 0.3,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: CupertinoButton(
                      child: Text(
                        "Already Registered???",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.offside(
                            fontSize: 20, color: Colors.white),
                      ),
                      onPressed: () => Navigator.pushNamed(context, '/login'),
                      color: Colors.grey.shade400,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.width * 0.3,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: CupertinoButton(
                      child: Text(
                        "New Here \nPlease Register!!",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.offside(
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            color: Colors.white),
                      ),
                      onPressed: () =>
                          Navigator.pushNamed(context, '/register'),
                      color: Colors.grey.shade400,
                    ),
                  )
                ],
              ),
            ),
            onBottom(AnimatedWave(
              height: 100,
              speed: 1.0,
              color: Colors.grey,
            )),
            onBottom(AnimatedWave(
              height: 120,
              speed: 0.9,
              offset: pi,
              color: Colors.grey,
            )),
            onBottom(AnimatedWave(
              height: 220,
              speed: 1.2,
              offset: pi / 2,
              color: Colors.grey,
            ))
          ],
        ),
      ),
    );
  }
}
