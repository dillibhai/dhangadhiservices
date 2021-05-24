
import 'package:flutter/material.dart';
import 'package:myservices/components/imageslide.dart';
import 'package:myservices/components/sickcontact.dart';
import 'package:myservices/pages/homepage.dart';

import '../constants.dart';

class SickDesc extends StatefulWidget {
  @override
  _SickDescState createState() => _SickDescState();
}

class _SickDescState extends State<SickDesc> {
  final List<String> imageList = [
    "assets/slidingimage/sick.JPG",
    "assets/slidingimage/ambulance.jpg",
    "assets/slidingimage/hospital.jpg",
    "assets/slidingimage/hospitalone.jpg",
    "assets/slidingimage/hospitaltwo.jpg",
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
          SickContact(),
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
                        'assets/slidingimage/sick.JPG',
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
