import 'dart:math';

import 'package:covidapp/animated/waves.dart';
import 'package:flutter/material.dart';

import '../mytxtfield.dart';

class Authpage extends StatefulWidget {
  @override
  _AuthpageState createState() => _AuthpageState();
}

class _AuthpageState extends State<Authpage> {
  final GlobalKey<FormState> _formKeyValue = new GlobalKey<FormState>();
  var _selectedId;
  var _selectedGender;
  bool _isSame = false;
  List<String> _idType = <String>[
    'AADHAR',
    'Driving Licence',
    'PAN',
    'Passport'
  ];
  DateTime _dateTime;

  List<String> _genderList = <String>[
    'Male',
    'Female',
    'Transgender',
    'Gay',
    'Lesbian'
  ];
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
            color: Colors.white,
          ),
          SingleChildScrollView(
            child: Form(
              key: _formKeyValue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Text("Email"),
                  MyTextField(
                    icon: Icons.portrait,
                    label: "Name",
                    hinttext: "Enter your name here",
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: DropdownButton(
                      elevation: 0,
                      icon: Icon(Icons.account_circle),
                      items: _idType
                          .map((value) => DropdownMenuItem(
                                child: Text(
                                  value,
                                  style: TextStyle(color: Colors.black87),
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
                        'Choose Account Type',
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
                                  style: TextStyle(color: Colors.black87),
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
                  // Container(child: Row(),),
                  GestureDetector(
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate:
                            _dateTime == null ? DateTime.now() : _dateTime,
                        firstDate: DateTime(2001),
                        lastDate: DateTime(2030),
                      ).then((value) {
                        setState(() {
                          _dateTime = value;
                        });
                      });
                    },
                    child: MyTextField(
                      readOnly: true,
                      icon: Icons.cake,
                      label: "Date of Birth",
                      hinttext: "DD/MM/YYYY ",
                    ),
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
  }
}
