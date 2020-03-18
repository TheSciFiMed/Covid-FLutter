import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpPage extends StatefulWidget {
  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  _forCallLeave() async {
    const url = 'tel:+91 8889499117';
    if (await canLaunch(url)) {
      await launch(url);
    } else
      throw 'Could not launch $url';
  }

  _forCovidHelpline() async {
    const url = 'tel:+91 8889499117';
    if (await canLaunch(url)) {
      await launch(url);
    } else
      throw 'Could not launch $url';
  }

  _forLearnMoreCovid() async {
    const url =
        'https://www.who.int/emergencies/diseases/novel-coronavirus-2019';
    if (await canLaunch(url)) {
      await launch(url);
    } else
      throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Help Center',
                    style: GoogleFonts.offside(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  )),
//
              Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.blue,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.call),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Call to get temporary leave'),
                      ],
                    ),
                    onPressed: _forCallLeave,
                  )),
              SelectableText(
                'Call your Nearsest Covid care provider: 1010101010',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, height: 3),
              ),
              SelectableText(
                'Call your Quanrantine Incharge: 1010101010',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, height: 3),
              ),

              SelectableText(
                'Call for Medicine/Water/Food: 1010101010',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, height: 3),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 50,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.blue,
                    child: Text('Learn More about Covid-19'),
                    onPressed: _forLearnMoreCovid,
                  )),

              Container(
                  height: 50,
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.blue,
                    child: Text('Call Covid Helpline'),
                    onPressed: _forCovidHelpline,
                  )),

              Container(
                  height: 50,
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.blue,
                    child: Text('Send your current location'),
                    onPressed: () {},
                  )),
            ],
          )),
    );
  }
}
