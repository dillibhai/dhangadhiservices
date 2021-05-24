import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:myservices/views/onboardingpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Image.asset('assets/images/dhangadhi.jpg'),
        nextScreen: OnBoardingPage(),
        splashIconSize: 400,
        splashTransition: SplashTransition.scaleTransition,
      ),
    );
  }
}
