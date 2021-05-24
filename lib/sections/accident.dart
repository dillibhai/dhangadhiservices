import 'package:flutter/material.dart';
import 'package:myservices/components/accidentcontact.dart';
import 'package:myservices/components/imageslide.dart';
import 'package:myservices/pages/homepage.dart';

import '../constants.dart';

class AccidentDesc extends StatefulWidget {
  @override
  _AccidentDescState createState() => _AccidentDescState();
}

class _AccidentDescState extends State<AccidentDesc> {
  final List<String> imageList = [
    "assets/slidingimage/accident.JPG",
    "assets/slidingimage/ambulance.jpg",
    "assets/slidingimage/hospitalone.jpg",
    "assets/slidingimage/police.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
       body: SingleChildScrollView(
            child: Column(children: [
          Container(
              // color: Color(0xffff5f6d),
              padding: const EdgeInsets.only(top: 20.0),
              child: ImageSliders(imageList: imageList)),
          AccidentContact(),
        ])));
  }
  Widget _appBar() {
    return AppBar(
      toolbarHeight: 70.0,
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Icon(Icons.arrow_back_ios)),
                Text(
                  "Fire Control Services",
                  style: Constants.headingone,
                ),
                Icon(Icons.notifications),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    // height: 70.0,
                    width: 80.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        'assets/slidingimage/accident.JPG',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              ],
            ),
            height: 70.0,
            width: 400,
          ),
        )
      ],
    );
  }
}
