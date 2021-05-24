import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myservices/views/drawer.dart';
import 'package:myservices/views/gridview.dart';
import 'package:wave_drawer/wave_drawer.dart';

import '../constants.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _appHomePage(),
      drawer: Container(
        // color: Colors.white,
        child: WaveDrawer(
          backgroundColor: Colors.lightGreen[900],
          boundaryColor: Colors.cyanAccent,
          boundaryWidth: 8.0,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              _appDrawerHeader(),
              DrawerTile(),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Row(
                  children: [
                    Row(children: [
                      Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Settings',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 2,
                        height: 20,
                        color: Colors.white,
                      ),
                    ]),
                    GestureDetector(
                      onTap: () {
                        FirebaseAuth.instance.signOut();
                      },
                      child: Column(
                        children: [
                          Row(children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Log out',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.logout,
                              color: Colors.white,
                            ),
                          ]),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _appHomePage() {
    return Gridview();
  }

  Widget _appDrawerHeader() {
    return Container(
      height: 220,
      color: Colors.deepPurpleAccent,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: EdgeInsets.only(top: 50.0),
              height: 68,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/images/nepal.png"),
                  ),
                  SizedBox(width: 5.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Dhangadhi Sub-metropolitan \nKailali Nepal',
                          style: Constants.headingone),
                      SizedBox(height: 7.0),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 7.0,
                            backgroundColor: Colors.cyan,
                          ),
                          SizedBox(width: 5.0),
                          Text('Active',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 20.0,
              left: 0.0,
              bottom: 0.0,
              right: 0.0,
            ),
            child: Text(
              'Email:dhangadhisubmetronepal@gmail.com',
              style: Constants.headingone,
            ),
            height: 50,
          ),
        ],
      ),
    );
  }

  Widget _appBar() {
    return AppBar(
      backgroundColor: Colors.amber[800],
      elevation: 2,
      toolbarHeight: 90,
      title: _myHeader(),
    );
  }

  Widget _myHeader() {
    return SizedBox(
        height: 60.0,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
            child: Column(
              children: [
                Text(
                  'Emergency Response system',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 3.0),
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.white),
                    Text(
                      'Dhangadhi sub-metro kailali',
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 2.0),
          Container(
            child: CircleAvatar(
              radius: 40.0,
              backgroundImage: AssetImage("assets/images/nepal.png"),
            ),
          ),
        ]));
  }
}
