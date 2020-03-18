import 'package:scoped_model/scoped_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

mixin ConnectedModel on Model {
  String _smsVerificationCode;
}
mixin UserModel on ConnectedModel {
  _verificationComplete(AuthCredential authCredential, BuildContext context) {
    FirebaseAuth.instance
        .signInWithCredential(authCredential)
        .then((authResult) {
      final snackBar =
          SnackBar(content: Text("Success!!! UUID is: " + authResult.user.uid));
      Scaffold.of(context).showSnackBar(snackBar);
    });
  }

  _smsCodeSent(String verificationId, List<int> code) {
    // set the verification code so that we can use it to log the user in
    _smsVerificationCode = verificationId;
  }

  _verificationFailed(AuthException authException, BuildContext context) {
    final snackBar = SnackBar(
        content:
            Text("Exception!! message:" + authException.message.toString()));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  _codeAutoRetrievalTimeout(String verificationId) {
    // set the verification code so that we can use it to log the user in
    _smsVerificationCode = verificationId;
  }

  _verifyPhoneNumber(
      BuildContext context, TextEditingController phoneNumController) async {
    String phoneNumber = "+91" + phoneNumController.text.toString();
    final FirebaseAuth _auth = FirebaseAuth.instance;

    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: Duration(seconds: 5),
        verificationCompleted: (authCredential) =>
            _verificationComplete(authCredential, context),
        verificationFailed: (authException) =>
            _verificationFailed(authException, context),
        codeAutoRetrievalTimeout: (verificationId) =>
            _codeAutoRetrievalTimeout(verificationId),
        // called when the SMS code is sent
        codeSent: (verificationId, [code]) =>
            _smsCodeSent(verificationId, [code]));
  }
}
