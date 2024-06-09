// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Screens/category.dart' as category_screen; // Adjusted import path
import 'Screens/DiseaseDetection/cancer_detection.dart' as cancer;
import 'Screens/DiseaseDetection/diabetes_detection.dart' as diabetes;
import 'Screens/DiseaseDetection/heart_disease_detection.dart' as heart;
import 'Screens/DiseaseDetection/liver_disease_detection.dart' as liver;
import 'Screens/DiseaseDetection/stroke_detection.dart' as stroke;
import 'Screens/DiseaseSelection/user_disease_selection.dart';
import 'Screens/settings.dart' as settings_screen;
import 'Screens/about.dart' as about_screen;


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      routes: {
        '/settings': (context) => settings_screen.Settings(),
        '/about': (context) => about_screen.About(),
        '/cancer': (context) => cancer.Cancer(),
        '/diabetes': (context) => diabetes.Diabetes(),
        '/heart': (context) => heart.HeartAttack(),
        '/liver': (context) => liver.Liver(),
        '/stroke': (context) => stroke.Stroke(),
        '/userSelect': (context) => UserDiseaseSelect(),
      },
      title: 'Health Check',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
      ).copyWith(
        brightness: Brightness.light, // or Brightness.dark based on your preference
      ),
      home: category_screen.Category(), // Using the alias
    );
  }
}

