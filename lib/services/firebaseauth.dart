import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myservices/pages/homepage.dart';
import 'package:myservices/pages/loginpage.dart';

class FirebaseInitialize extends StatefulWidget {
  @override
  _FirebaseInitializeState createState() => _FirebaseInitializeState();
}

class _FirebaseInitializeState extends State<FirebaseInitialize> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("Error: ${snapshot.error}"),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, streamSnapshot) {
              if (streamSnapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text("Error: ${streamSnapshot.error}"),
                  ),
                );
              }
              if (streamSnapshot.connectionState == ConnectionState.active) {
                //if user is loged in
                User _user = streamSnapshot.data;
                //if user is not loged in
                if (_user == null) {
                  return LoginPage();
                } else {
                  return HomePage();
                }
              }
              //checking authentication..
              else {
                return Scaffold(
                  body: Center(
                      child: Text(
                    "Checking Firebase Authentication...",
                  )),
                );
              }
            },
          );
        } else {
          return Scaffold(body: Center(child: Text("Initialization app...")));
        }
      },
    );
  }
}
