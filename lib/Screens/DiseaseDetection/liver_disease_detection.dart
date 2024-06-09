// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print, unnecessary_cast, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:health_checkup/Resources/RoundedButton.dart';
import 'package:health_checkup/Resources/TextformField.dart';

class Liver extends StatefulWidget {
  @override
  _LiverState createState() => _LiverState();
}

class _LiverState extends State<Liver> {
  final _formKey = GlobalKey<FormState>();

  late double age,
      male,
      female,
      total_Bilirubin,
      direct_Bilirubin,
      alkaline_Phosphotase,
      alamine_Aminotransferase,
      aspartate_Aminotransferase,
      total_Protiens,
      albumin,
      albumin_and_Globulin_Ratio;
  late int? select;

  Row addRadioButton(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: Theme.of(context).primaryColor,
          value: btnValue,
          groupValue: select,
          onChanged: (value) {
            setState(() {
              print(value);
              select = value as int?;
              if (btnValue == 1) {
                male = 1;
                female = 0;
              } else {
                male = 0;
                female = 1;
              }
            });
          },
        ),
        Text(title)
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
                    padding: const EdgeInsets.only(
                        top: 20.0, left: 10.0, right: 10.0),
                    child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Liver Disease',
                                style: TextStyle(
                                    fontSize: 35.0, fontFamily: 'Langar'),
                              ),
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Detection',
                                style: TextStyle(
                                    fontSize: 35.0, fontFamily: 'Langar'),
                              ),
                            ]),
                      ],
                    )),
                SizedBox(
                  height: 20,
                  child: Divider(
                    color: Colors.white,
                    thickness: 0.8,
                  ),
                  width: 350,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('Enter the following details',
                                style: TextStyle(
                                    fontSize: 20.0, fontFamily: 'Langar')),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFField(
                          hintText: 'Age',
                          onChanged: (value) {
                            setState(() {
                              age = double.tryParse(value) ?? 0.0;
                            });
                          },
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Please enter value';
                            } else {
                              age = double.tryParse(val) ?? 0.0;
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Gender',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        Wrap(
                          children: [
                            addRadioButton(1, "Male"),
                            addRadioButton(0, "Female"),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFField(
                          hintText: 'Total Bilirubin',
                          onChanged: (value) {
                            setState(() {
                              total_Bilirubin = double.tryParse(value) ?? 0.0;
                            });
                          },
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Please enter value';
                            } else {
                              total_Bilirubin = double.tryParse(val) ?? 0.0;
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // Repeat the above pattern for other TextFField widgets

                        RoundedButton(
                          color: Colors.orangeAccent,
                          text: 'Submit',
                          press: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Processing Data')));
                            }
                          },
                        ),
                      ],
                    ),
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
