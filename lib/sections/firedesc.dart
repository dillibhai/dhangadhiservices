import 'package:flutter/material.dart';
import 'package:myservices/components/firecontact.dart';
import 'package:myservices/components/imageslide.dart';
import 'package:myservices/pages/homepage.dart';

import '../constants.dart';

class FireDesc extends StatefulWidget {
  @override
  _FireDescState createState() => _FireDescState();
}

class _FireDescState extends State<FireDesc> {
  final List<String> imageList = [
    "assets/slidingimage/fire.JPG",
    "assets/slidingimage/truckone.jpg",
    "assets/slidingimage/trucktwo.jpg",
    "assets/slidingimage/truckthree.jpg",
    "assets/slidingimage/plane.jpg",
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
          Contact(),
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
                        'assets/slidingimage/fire.JPG',
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
