import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

mixin ConnectedModel on Model {
  String _smsVerificationCode;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final _fireStoreReference = Firestore.instance;
  bool isLoading = false;
  bool isAuthenticated = false;
  String errorMessage;
  FirebaseUser user;
}
mixin UserModel on ConnectedModel {
  addFirstPageData() {}

  Future<Map<String, dynamic>> authenticate(
      String email, String password, BuildContext context) async {
    isLoading = true;
    notifyListeners();

    try {
      AuthResult authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = authResult.user;
      // .catchError(onError)
      //     .then((AuthResult _authresult) {
      //   user = _authresult.user;

      //   isLoading = false;
      //   notifyListeners();
      //   if (_authresult.user != null) {
      //     if (_authresult.user.email == email) {
      //       isAuthenticated = true;
      //       notifyListeners();
      //       Navigator.pushReplacementNamed(context, '/homepage');
      //     }
      //   }
      // });

      // print(authstatus);
    } on PlatformException catch (error) {
      switch (error.code) {
        case "ERROR_INVALID_EMAIL":
          errorMessage = "Your email address appears to be malformed.";
          break;
        case "ERROR_WRONG_PASSWORD":
          errorMessage = "Your password is wrong.";
          break;
        case "ERROR_USER_NOT_FOUND":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "ERROR_USER_DISABLED":
          errorMessage = "User with this email has been disabled.";
          break;
        case "ERROR_TOO_MANY_REQUESTS":
          errorMessage = "Too many requests. Try again later.";
          break;
        case "ERROR_OPERATION_NOT_ALLOWED":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
      // showDialog(
      //     context: context,
      //     builder: (BuildContext context) {
      //       return CupertinoAlertDialog(
      //         title: Text(
      //           error.toString(),
      //         ),
      //       );
      //     });
      // print(error);

      // showDialog(context: context,);
    }
    if (errorMessage != null) {
      return Future.error(errorMessage);
    }

    return {
      'uid': user.uid,
      'email': user.email,
    };
  }

  ////////////////////////////////////////////////////////////////////////////
  // _verificationComplete(AuthCredential authCredential, BuildContext context) {
  //   _firebaseAuth.signInWithCredential(authCredential).then((authResult) {
  //     final snackBar =
  //         SnackBar(content: Text("Success!!! UUID is: " + authResult.user.uid));
  //     Scaffold.of(context).showSnackBar(snackBar);
  //   });
  // }

  // _smsCodeSent(String verificationId, List<int> code) {
  //   // set the verification code so that we can use it to log the user in
  //   _smsVerificationCode = verificationId;
  // }

  // _verificationFailed(AuthException authException, BuildContext context) {
  //   final snackBar = SnackBar(
  //       content:
  //           Text("Exception!! message:" + authException.message.toString()));
  //   Scaffold.of(context).showSnackBar(snackBar);
  // }

  // _codeAutoRetrievalTimeout(String verificationId) {
  //   // set the verification code so that we can use it to log the user in
  //   _smsVerificationCode = verificationId;
  // }

  // _verifyPhoneNumber(
  //     BuildContext context, TextEditingController phoneNumController) async {
  //   String phoneNumber = "+91" + phoneNumController.text.toString();

  //   await _firebaseAuth.verifyPhoneNumber(
  //       phoneNumber: phoneNumber,
  //       timeout: Duration(seconds: 5),
  //       verificationCompleted: (authCredential) =>
  //           _verificationComplete(authCredential, context),
  //       verificationFailed: (authException) =>
  //           _verificationFailed(authException, context),
  //       codeAutoRetrievalTimeout: (verificationId) =>
  //           _codeAutoRetrievalTimeout(verificationId),
  //       // called when the SMS code is sent
  //       codeSent: (verificationId, [code]) =>
  //           _smsCodeSent(verificationId, [code]));
  // }
  ////////////////////////////////////////////////////////////////////////////

}
