import 'package:covidapp/mytxtfield.dart';
import 'package:flutter/material.dart';

class SecondRegisterPage extends StatefulWidget {
  @override
  _SecondRegisterPageState createState() => _SecondRegisterPageState();
}

class _SecondRegisterPageState extends State<SecondRegisterPage> {
  List<String> _genderList = <String>[
    'Male',
    'Female',
    'Transgender',
  ];
  String _selectedGender;
  DateTime _dateTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Profile"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                    ),
                    Text("Are you Advised to be in Quarantine?"),
                  ],
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: FlatButton(
                    onPressed: () {},
                    color: Colors.blueGrey,
                    child: Text(
                      "Update Qurantine location",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                    ),
                    Text("Mobility / Living Assistance required ?"),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(),
                Align(
                  child: Text("Emergency Contact"),
                ),
                Divider(),
                MyTextField(
                  label: "Name",
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
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
                      isExpanded: true,
                      hint: Text(
                        'Choose Gender ',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate:
                          _dateTime == null ? DateTime.now() : _dateTime,
                      firstDate: DateTime(1940),
                      lastDate: DateTime(2030),
                    ).then((value) {
                      setState(() {
                        _dateTime = value;
                      });
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
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
                                style: TextStyle(color: Colors.grey),
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
                  label: "Relationship",
                ),
                MyTextField(
                  label: "Phone Number",
                ),
                MyTextField(
                  label: "Email",
                ),
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                    ),
                    Text("Is Emergency Contact is your Caregiver now ??"),
                  ],
                ),
                FlatButton(
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Colors.blueGrey,
                  onPressed: () {},
                  child: Text(
                    "Update",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
