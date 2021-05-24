import 'package:flutter/material.dart';
import 'package:myservices/components/fightcontact.dart';
import 'package:myservices/components/imageslide.dart';
import 'package:myservices/pages/homepage.dart';

import '../constants.dart';

class FightDesc extends StatefulWidget {
  @override
  _FightDescState createState() => _FightDescState();
}

class _FightDescState extends State<FightDesc> {
  final List<String> imageList = [
    "assets/slidingimage/fight.JPG",
    "assets/slidingimage/police.jpg",
    "assets/slidingimage/policetwo.jpg",
    "assets/slidingimage/policethree.jpg",
    "assets/slidingimage/policefour.jpg",
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
          FightContact(),
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
                        'assets/slidingimage/fight.JPG',
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
