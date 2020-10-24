import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function onChanged;
  final Function onSaved;
  final String hinttext;
  final bool readOnly;
  final Function validator;
  final bool autovalidate;
  final bool isObscure;
  MyTextField(
      {this.icon,
      this.label,
      this.onChanged,
      this.hinttext,
      this.onSaved,
      this.readOnly = false,
      this.validator,
      this.autovalidate = false,
      this.isObscure = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      child: TextFormField(
        readOnly: readOnly,
        obscureText: isObscure,
        onSaved: onSaved,
        autovalidate: autovalidate,
        onChanged: onChanged,
        validator: validator,
        decoration: InputDecoration(
          hintText: hinttext,
          hintMaxLines: 2,
          filled: true,
          fillColor: Colors.white,
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey.shade500),
          focusedBorder: InputBorder.none,
          // OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(15),
          //   borderSide: BorderSide(
          //     color: Colors.grey,
          //   ),
          // ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Colors.grey.shade100,
              )),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          prefixIcon: Icon(
            icon,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
