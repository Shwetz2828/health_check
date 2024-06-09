// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, avoid_print

import 'package:flutter/material.dart';
import 'package:health_checkup/Resources/RoundedButton.dart';
import 'package:health_checkup/Resources/TextformField.dart';

class Stroke extends StatefulWidget {
  @override
  _StrokeState createState() => _StrokeState();
}

class _StrokeState extends State<Stroke> {
  final _formKey = GlobalKey<FormState>();

  String? selectGender;
  String? selectHypertension;
  String? selectHeartDisease;
  String? selectMarried;
  String? selectWorkType;
  String? selectResidentType;
  String? selectSmokingStatus;
  late double age, glucose, bmi;

  Row addRadioButton(int btnValue, String title, String? groupValue, Function(Object?) onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: Theme.of(context).primaryColor,
          value: btnValue.toString(),
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        Text(title),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Strokes Disease',
                            style: TextStyle(fontSize: 35.0, fontFamily: 'Langar'),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Detection',
                            style: TextStyle(fontSize: 35.0, fontFamily: 'Langar'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                  child: Divider(
                    color: Colors.white,
                    thickness: 0.8,
                  ),
                  width: 350,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Enter the following details',
                              style: TextStyle(fontSize: 20.0, fontFamily: 'Langar'),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Gender', style: TextStyle(fontSize: 20.0)),
                        Wrap(
                          children: [
                            addRadioButton(1, "Male", selectGender, (value) {
                              setState(() {
                                selectGender = value as String?;
                              });
                            }),
                            addRadioButton(0, "Female", selectGender, (value) {
                              setState(() {
                                selectGender = value as String?;
                              });
                            }),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Enter your Age', style: TextStyle(fontSize: 20.0)),
                        TextFField(
                          hintText: 'Age',
                          onChanged: (value) {
                            setState(() {
                              age = double.parse(value);
                            });
                          },
                          validator: (val) {
                            if (val.isEmpty || val == null) {
                              return 'Please enter value';
                            } else {
                              age = double.parse(val);
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Hypertension', style: TextStyle(fontSize: 20.0)),
                        Wrap(
                          children: [
                            addRadioButton(1, "Yes", selectHypertension, (value) {
                              setState(() {
                                selectHypertension = value as String?;
                              });
                            }),
                            addRadioButton(0, "No", selectHypertension, (value) {
                              setState(() {
                                selectHypertension = value as String?;
                              });
                            }),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Previous Heart Disease', style: TextStyle(fontSize: 20.0)),
                        Wrap(
                          children: [
                            addRadioButton(1, "Yes", selectHeartDisease, (value) {
                              setState(() {
                                selectHeartDisease = value as String?;
                              });
                            }),
                            addRadioButton(0, "No", selectHeartDisease, (value) {
                              setState(() {
                                selectHeartDisease = value as String?;
                              });
                            }),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Married', style: TextStyle(fontSize: 20.0)),
                        Wrap(
                          children: [
                            addRadioButton(1, "Yes", selectMarried, (value) {
                              setState(() {
                                selectMarried = value as String?;
                              });
                            }),
                            addRadioButton(0, "No", selectMarried, (value) {
                              setState(() {
                                selectMarried = value as String?;
                              });
                            }),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Work Type', style: TextStyle(fontSize: 20.0)),
                        Wrap(
                          children: [
                            addRadioButton(0, "Govt. job", selectWorkType, (value) {
                              setState(() {
                                selectWorkType = value as String?;
                              });
                            }),
                            addRadioButton(1, "Never worked", selectWorkType, (value) {
                              setState(() {
                                selectWorkType = value as String?;
                              });
                            }),
                            addRadioButton(2, "Private", selectWorkType, (value) {
                              setState(() {
                                selectWorkType = value as String?;
                              });
                            }),
                            addRadioButton(3, "Self-employed", selectWorkType, (value) {
                              setState(() {
                                selectWorkType = value as String?;
                              });
                            }),
                            addRadioButton(4, "Children", selectWorkType, (value) {
                              setState(() {
                                selectWorkType = value as String?;
                              });
                            }),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Resident Type', style: TextStyle(fontSize: 20.0)),
                        Wrap(
                          children: [
                            addRadioButton(1, "Urban", selectResidentType, (value) {
                              setState(() {
                                selectResidentType = value as String?;
                              });
                            }),
                            addRadioButton(0, "Rural", selectResidentType, (value) {
                              setState(() {
                                selectResidentType = value as String?;
                              });
                            }),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Glucose Level:', style: TextStyle(fontSize: 20.0)),
                        TextFField(
                          hintText: 'Glucose',
                          onChanged: (value) {
                            setState(() {
                              glucose = double.parse(value);
                            });
                          },
                          validator: (val) {
                            if (val.isEmpty || val == null) {
                              return 'Please enter value';
                            } else {
                              glucose = double.parse(val);
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Enter your BMI', style: TextStyle(fontSize: 20.0)),
                        TextFField(
                          hintText: 'BMI',
                          onChanged: (value) {
                            setState(() {
                              bmi = double.parse(value);
                            });
                          },
                          validator: (val) {
                            if (val.isEmpty || val == null) {
                              return 'Please enter value';
                            } else {
                              bmi = double.parse(val);
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Smoking Status', style: TextStyle(fontSize: 20.0)),
                        Wrap(
                          children: [
                            addRadioButton(0, "Unknown", selectSmokingStatus, (value) {
                              setState(() {
                                selectSmokingStatus = value as String?;
                              });
                            }),
                            addRadioButton(1, "Formerly Smoked", selectSmokingStatus, (value) {
                              setState(() {
                                selectSmokingStatus = value as String?;
                              });
                            }),
                            addRadioButton(2, "Never Smoked", selectSmokingStatus, (value) {
                              setState(() {
                                selectSmokingStatus = value as String?;
                              });
                            }),
                            addRadioButton(3, "Smokes", selectSmokingStatus, (value) {
                              setState(() {
                                selectSmokingStatus = value as String?;
                              });
                            }),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        RoundedButton(
                          color: Colors.orangeAccent,
                          text: 'Submit',
                          press: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Processing Data')),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
