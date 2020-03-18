import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
                padding: EdgeInsets.all(40),
                child: Text(
                  "Keep Silence!!!\n Developer working",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      fontSize: MediaQuery.of(context).size.width * 0.09),
                )),
          ),
          FlareActor(
            'assets/coding.flr',
            animation: 'coding',
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
