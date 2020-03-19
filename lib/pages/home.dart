// import 'package:flare_flutter/flare_actor.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:covidapp/const.dart';
import 'package:flutter/cupertino.dart';
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
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
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
          SizedBox(
            height: 40,
          ),
          CarouselSlider(
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
            autoPlay: true,
            enableInfiniteScroll: true,
            autoPlayInterval: Duration(seconds: 3),
            height: 180.0,
            items: imageLIst.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(color: Color(0xFF0099CB)),
                    child: Image.network(i),
                  );
                },
              );
            }).toList(),
          ),
          SizedBox(
            height: 20,
          ),
          CarouselSlider(
            enlargeCenterPage: true,
            scrollDirection: Axis.vertical,

            autoPlay: true,
            // enableInfiniteScroll: true,
            autoPlayInterval: Duration(seconds: 3),
            height: 180.0,
            items: imageList2.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(color: Color(0xFF0099CB)),
                    child: Image.network(i),
                  );
                },
              );
            }).toList(),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width * 0.8,
            child: CupertinoButton(
              color: Colors.blueGrey,
              // disabledColor: Colors.grey,
              child: Text("HelpLine"),
              onPressed: () => Navigator.pushNamed(context, '/help'),
            ),
          )
        ],
      ),
    );
  }
}
