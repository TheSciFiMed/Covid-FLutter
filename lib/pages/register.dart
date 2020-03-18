import 'dart:math';

import 'package:covidapp/animated/waves.dart';
import 'package:covidapp/const.dart';
import 'package:covidapp/scoped-models/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoped_model/scoped_model.dart';

import '../mytxtfield.dart';

class Registrationpage extends StatefulWidget {
  @override
  _RegistrationpageState createState() => _RegistrationpageState();
}

class _RegistrationpageState extends State<Registrationpage> {
  final GlobalKey<FormState> _formKeyValue = new GlobalKey<FormState>();
  // final TextEditingController _passwordTextController = TextEditingController();
  var _selectedId;
  var _selectedGender;
  var _selectedStatus;
  bool _isSame = false;
  int selectitem = 0;
  DateTime _dateTime;

  List<String> _idType = <String>[
    'AADHAR',
    'Driving Licence',
    'PAN',
    'Passport'
  ];
  // DateTime _dateTime;

  List<String> _genderList = <String>[
    'Male',
    'Female',
    'Transgender',
  ];
  List<String> _statusList = <String>[
    'Healthy',
    'Suspected',
    'Infected',
    'Caring for Patient',
  ];
  // List<String> _g
  @override
  Widget build(BuildContext context) {
    onBottom(Widget child) => Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: child,
          ),
        );
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainModel model) {
        return model.isLoading
            ? Scaffold(
                body: Center(
                  child: Column(
                    children: <Widget>[
                      Image.network(
                        imageLIst[0],
                      ),
                      LinearProgressIndicator()
                    ],
                  ),
                ),
              )
            : Scaffold(
                body: SafeArea(
                    child: Stack(
                  children: <Widget>[
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      color: Colors.white,
                    ),
                    SingleChildScrollView(
                      child: Form(
                        key: _formKeyValue,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
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
                            // Text("Email"),
                            MyTextField(
                              icon: Icons.person,
                              label: "Name",
                              hinttext: "Enter your name here",
                            ),
                            // Container(
                            //   padding: EdgeInsets.symmetric(horizontal: 30),
                            //   // margin: EdgeInsets.symmetric(horizontal: 40),
                            //   child: CupertinoPicker(
                            //       itemExtent: 25,
                            //       magnification: 1.5,
                            //       looping: true,
                            //       onSelectedItemChanged: (int index) {
                            //         setState(() {
                            //           selectitem = index;
                            //         });
                            //       },
                            //       children: _genderList),
                            // ),
                            Align(
                              alignment: Alignment.center,
                              child: DropdownButton(
                                elevation: 10,
                                // icon: Icon(Icons.),
                                items: _idType
                                    .map((value) => DropdownMenuItem(
                                          child: Text(
                                            value,
                                            style: TextStyle(
                                                color: Colors.black87),
                                          ),
                                          value: value,
                                        ))
                                    .toList(),
                                onChanged: (selectedAccountType) {
                                  print('$selectedAccountType');
                                  setState(() {
                                    _selectedId = selectedAccountType;
                                  });
                                },
                                value: _selectedId,
                                isExpanded: false,
                                hint: Text(
                                  'Choose ID Type',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                            MyTextField(
                              icon: Icons.portrait,
                              label: _selectedId == null
                                  ? "ID Number"
                                  : "$_selectedId Number",
                              hinttext: "Enter your $_selectedId Number here",
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: DropdownButton(
                                elevation: 0,
                                items: _genderList
                                    .map((value) => DropdownMenuItem(
                                          child: Text(
                                            value,
                                            style: TextStyle(
                                                color: Colors.black87),
                                          ),
                                          value: value,
                                        ))
                                    .toList(),
                                onChanged: (selectedGenderType) {
                                  print('$_selectedGender');
                                  setState(() {
                                    _selectedGender = selectedGenderType;
                                  });
                                },
                                value: _selectedGender,
                                isExpanded: false,
                                hint: Text(
                                  'Choose Gender ',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: DropdownButton(
                                elevation: 10,
                                // icon: Icon(Icons.),
                                items: _statusList
                                    .map((value) => DropdownMenuItem(
                                          child: Text(
                                            value,
                                            style: TextStyle(
                                                color: Colors.black87),
                                          ),
                                          value: value,
                                        ))
                                    .toList(),
                                onChanged: (val) {
                                  print('$val');
                                  setState(() {
                                    _selectedStatus = val;
                                  });
                                },
                                value: _selectedStatus,
                                isExpanded: false,
                                hint: Text(
                                  'Select Status ',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: _dateTime == null
                                      ? DateTime.now()
                                      : _dateTime,
                                  firstDate: DateTime(1940),
                                  lastDate: DateTime(2030),
                                ).then((value) {
                                  setState(() {
                                    _dateTime = value;
                                  });
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 10),
                                margin: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      style: BorderStyle.solid,
                                      color: Colors.grey.shade100),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.cake,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    _dateTime == null
                                        ? Text(
                                            "Date of Birth",
                                            style:
                                                TextStyle(color: Colors.grey),
                                          )
                                        : Text(
                                            "${_dateTime.day}/${_dateTime.month}/${_dateTime.year}",
                                            style: TextStyle(),
                                          )
                                  ],
                                ),
                              ),
                            ),

                            MyTextField(
                              icon: Icons.email,
                              label: "Email",
                              hinttext: "Enter your Email here",
                            ),
                            MyTextField(
                              icon: Icons.call_end,
                              label: "Phone Number",
                              hinttext: "Enter your Phone Number here",
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Checkbox(
                                    value: _isSame,
                                    onChanged: (bool value) {
                                      setState(() {
                                        _isSame = value;
                                      });
                                    }),
                                Text("Is your Whatsapp is same as above Number")
                              ],
                            ),
                            _isSame
                                ? Container()
                                : MyTextField(
                                    icon: Icons.call,
                                    label: "Whatsapp Number",
                                    hinttext: "Enter your Whatsapp Number here",
                                  ),

                            Center(
                              child: FlatButton.icon(
                                color: Color(0XFFEFF3F6),
                                onPressed: () {},
                                icon: Icon(Icons.arrow_forward),
                                label: Text("Proceed to Next Step"),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    onBottom(AnimatedWave(
                      height: 100,
                      speed: 1.0,
                    )),
                    onBottom(AnimatedWave(
                      height: 120,
                      speed: 0.9,
                      offset: pi,
                    )),
                    onBottom(AnimatedWave(
                      height: 220,
                      speed: 1.2,
                      offset: pi / 2,
                    ))
                  ],
                )),
              );
      },
    );
  }

  _onSubmit() {
    _formKeyValue.currentState.validate();
    _formKeyValue.currentState.save();
  }
}
