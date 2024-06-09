// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:health_checkup/Resources/RoundedButton.dart';
import 'package:health_checkup/Resources/TextformField.dart';

class Diabetes extends StatefulWidget {
  const Diabetes({Key? key}) : super(key: key);

  @override
  _DiabetesState createState() => _DiabetesState();
}

class _DiabetesState extends State<Diabetes> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  double glucose = 0,
      bloodPressure = 0,
      skinThickness = 0,
      insulin = 0,
      bmi = 0,
      diabetesPedigreeFunction = 0,
      age = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key('diabetesScaffoldKey'),
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
                    children: const [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Diabetes Disease',
                            style: TextStyle(
                                fontSize: 35.0, fontFamily: 'Langar'),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Detection',
                            style: TextStyle(
                                fontSize: 35.0, fontFamily: 'Langar'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 350,
                  child: const Divider(
                    color: Colors.white,
                    thickness: 0.8,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            Text('Enter the following details',
                                style: TextStyle(
                                    fontSize: 20.0, fontFamily: 'Langar')),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFField(
                          hintText: 'Glucose Level',
                          onChanged: (value) {
                            setState(() {
                              glucose = double.parse(value);
                            });
                          },
                          validator: (val) {
                            if (val.isEmpty) {
                              return 'Please enter value';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // Add other TextFField widgets similarly for other inputs

                        RoundedButton(
                          color: Colors.orangeAccent,
                          text: 'Submit',
                          press: () {
                            if (_formKey.currentState!.validate()) {
                              // Process data here
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
