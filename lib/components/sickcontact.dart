import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';

class SickContact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.0),
      height: 500.0,
      child: GridView.count(
        scrollDirection: Axis.vertical,
        crossAxisCount: 2,
        children: [
          GestureDetector(
            onTap: () {
              makecall();
            },
            child: Card(
              elevation: 5,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      "assets/icons/phone-call.png",
                      height: 100.0,
                    ),
                    Text(
                      "Call Us",
                      style: Constants.gridtitle,
                    )
                  ]),
            ),
          ),
          GestureDetector(
            onTap: () {
              sentmessage();
            },
            child: Card(
              elevation: 5,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      "assets/icons/conversation.png",
                      height: 100.0,
                    ),
                    Text(
                      "Message ",
                      style: Constants.gridtitle,
                    )
                  ]),
            ),
          ),
          GestureDetector(
            onTap: () {
              sentmail();
            },
            child: Card(
              elevation: 5,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      "assets/icons/gmail.png",
                      height: 100.0,
                    ),
                    Text(
                      "Mail Us",
                      style: Constants.gridtitle,
                    )
                  ]),
            ),
          ),
          GestureDetector(
            onTap: () {
              joinwhatsapp();
            },
            child: Card(
              elevation: 5,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      "assets/icons/whatsapp.png",
                      height: 100.0,
                    ),
                    Text(
                      "Join Us",
                      style: Constants.gridtitle,
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  makecall() {
    String makecall = "tel:9868187579";
    launch(makecall);
  }

  sentmessage() {
    String sentsms = "sms:9868187579";
    launch(sentsms);
  }

  sentmail() {
    String sentmail = "mailto:dhangadhihospital1@gmail.com";
    launch(sentmail);
  }

  joinwhatsapp() {
    String joinwhatsapp = "https://wa.me/7638753653";
    launch(joinwhatsapp);
  }
}
