import 'package:flutter/material.dart';
import 'package:myservices/sections/accident.dart';
import 'package:myservices/sections/covid.dart';
import 'package:myservices/sections/desaster.dart';
import 'package:myservices/sections/fightdesc.dart';
import 'package:myservices/sections/firedesc.dart';
import 'package:myservices/sections/sickdesc.dart';

import '../constants.dart';

class Gridview extends StatelessWidget {
  const Gridview({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30.0),
      height: 700,
      child: GridView.count(
        scrollDirection: Axis.vertical,
        crossAxisCount: 2,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => FireDesc()));
            },
            child: Card(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/fire.png",
                    height: 130,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Fire Report",
                    style: Constants.gridtitle,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => FightDesc()));
            },
            child: Card(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/fight.png",
                    fit: BoxFit.cover,
                    height: 130,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Thif & Fight Report",
                    style: Constants.gridtitle,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => SickDesc()));
            },
            child: Card(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/patient.png",
                    height: 130,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Sick Report",
                    style: Constants.gridtitle,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => AccidentDesc()));
            },
            child: Card(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/fender-bender.png",
                    height: 130,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Accident Report",
                    style: Constants.gridtitle,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => DesasterDesc()));
            },
            child: Card(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/natural-disaster.png",
                    height: 130,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Natural Desaster",
                    style: Constants.gridtitle,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => CovidDesc()));
            },
            child: Card(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/safety-suit.png",
                    height: 130,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Covid 19 Report",
                    style: Constants.gridtitle,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
