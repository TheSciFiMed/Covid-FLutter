import 'dart:math';

import 'package:covidapp/animated/waves.dart';
import 'package:covidapp/mytxtfield.dart';
import 'package:covidapp/scoped-models/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {
    'email': null,
    'password': null,
  };
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
                  child: CircularProgressIndicator(),
                ),
              )
            : Scaffold(
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
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            MyTextField(
                              icon: Icons.email,
                              label: "Email",
                              hinttext: "Enter your Email here",
                              validator: (String value) {
                                if (value.isEmpty ||
                                    !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                                        .hasMatch(value)) {
                                  return "Please Enter a Valid Email";
                                }
                              },
                              onSaved: (String value) {
                                _formData['email'] = value;
                              },
                              // autovalidate: true,
                            ),
                            MyTextField(
                              icon: Icons.account_circle,
                              label: "Password",
                              hinttext: "Enter your Password here...",
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return "Invalid Password";
                                }
                              },
                              onSaved: (String value) {
                                _formData['password'] = value;
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CupertinoButton(
                              onPressed: () =>
                                  _submitForm(model.authenticate, context),
                              child: Text("LOGIN"),
                              color: Colors.grey.shade400,
                            )
                          ],
                        ),
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
      },
    );
  }

  void _submitForm(Function authenticate, BuildContext context) async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    Map<String, dynamic> successInformation;
    successInformation =
        await authenticate(_formData['email'], _formData['password'], context);
  }
}
