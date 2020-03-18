import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function onChanged;
  final Function onSubmitted;
  final String hinttext;
  final bool readOnly;
  MyTextField(
      {this.icon,
      this.label,
      this.onChanged,
      this.hinttext,
      this.onSubmitted,
      this.readOnly = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      child: TextFormField(
        readOnly: readOnly,
        onChanged: onChanged,
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
