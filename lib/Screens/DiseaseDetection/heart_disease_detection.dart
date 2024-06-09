// ignore_for_file: prefer_final_fields, unused_field, library_private_types_in_public_api, unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';

import '../../../Resources/RoundedButton.dart';
import '../../../Resources/TextformField.dart';

class HeartAttack extends StatefulWidget {
  const HeartAttack({Key? key}) : super(key: key);

  @override
  _HeartAttackState createState() => _HeartAttackState();
}

class _HeartAttackState extends State<HeartAttack> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  double _age = 0;
  double _trestbps = 0;
  double _chol = 0;
  double _thalach = 0;
  double _oldpeak = 0;
  double _slope = 0;
  String _selectGender = '';

  Row addRadioButton(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: Theme.of(context).primaryColor,
          value: btnValue.toString(),
          groupValue: _selectGender,
          onChanged: (value) {
            setState(() {
              _selectGender = value.toString();
            });
          },
        ),
        Text(
          title,
        ),
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
                    top: 20.0,
                    left: 10.0,
                    right: 10.0,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Heart Attack',
                            style: TextStyle(
                              fontSize: 35.0,
                              fontFamily: 'Langar',
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Detection',
                            style: TextStyle(
                              fontSize: 35.0,
                              fontFamily: 'Langar',
                            ),
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
                  padding: const EdgeInsets.only(
                    top: 20.0,
                    left: 10.0,
                    right: 10.0,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Enter the following details',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'Langar',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(hintText: 'Age'),
                          onChanged: (value) {
                            setState(() {
                              _age = double.parse(value);
                            });
                          },
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Please enter value';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        const Text(
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
                        RoundedButton(
                          color: Colors.orangeAccent,
                          text: 'Submit',
                          press: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Processing Data'),
                                ),
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
