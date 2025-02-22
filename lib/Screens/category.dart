// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetFloat1;
  late Animation<Offset> _offsetFloat2;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _offsetFloat1 = Tween<Offset>(begin: Offset(2.0, 0.0), end: Offset.zero)
        .animate(_controller);

    _offsetFloat1.addListener(() {
      setState(() {});
    });

    _offsetFloat2 = Tween<Offset>(begin: Offset(-2.0, 0.0), end: Offset.zero)
        .animate(_controller);

    _offsetFloat2.addListener(() {
      setState(() {});
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget catrgorySection(String image) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
        boxShadow: [
          BoxShadow(
              color: Colors.pinkAccent,
              blurRadius: 10,
              spreadRadius: 0,
              offset: Offset(2, 2))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        Navigator.pushNamed(context, '/settings');
      },
      backgroundColor: Colors.yellow[900],
      child: Icon(Icons.settings, size: 30.0,),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            
            Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    'Health Check',
                    style: TextStyle(fontSize: 35.0, fontFamily: 'Langar'),
                  ),
                ])),
            SlideTransition(
              position: _offsetFloat1,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/userSelect');
                },
                child: Padding(
                    padding: const EdgeInsets.only(
                        top: 40.0, right: 10.0, left: 70.0, bottom: 20.0),
                    child: catrgorySection('assets/images/user.png')),
              ),
            ),
            SlideTransition(
              position: _offsetFloat2,
              child: GestureDetector(onTap: () {},
                child: Padding( 
                    padding: const EdgeInsets.only(
                        top: 20.0, right: 70.0, left: 10.0, bottom: 20.0),
                    child: catrgorySection('assets/images/doctor.jpg')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
// TODO Implement this library.