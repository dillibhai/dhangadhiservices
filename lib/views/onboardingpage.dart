import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:myservices/services/firebaseauth.dart';
import 'package:myservices/widgets/onboardingbtn.dart';

class OnBoardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SafeArea(
        child: Container(
          child: IntroductionScreen(
            color: Colors.white,
            pages: [
              PageViewModel(
                title: 'Dhangadhi Hospital Pvt Ltd',
                body:
                    'An institution where the sick or injured are given medical or surgical care. We have 24 hour services.',
                image: buildImage('assets/images/pichospital.png'),
                decoration: getPageDecoration(),
              ),
              PageViewModel(
                title: 'Dhangadhi Fire Control Services',
                body:
                    'Inside the engine are radio systems, flashlights, thermal imaging cameras, and four air tanks with 40 minutes of air each. The air tanks are placed on the seats in order to be strapped on quickly by firefighters while seated.',
                image: buildImage('assets/images/firetruck.png'),
                decoration: getPageDecoration(),
              ),
              PageViewModel(
                title: 'Dhangadhi Police Force',
                body:
                    'The police are a constituted body of persons empowered by a state, with the aim to enforce the law, to ensure the safety, health and possessions of citizens, and to prevent crime and civil disorder.',
                footer: ButtonWidget(
                  text: 'Start Services',
                  onClicked: () => goToHome(context),
                ),
                image: buildImage('assets/images/police.png'),
                decoration: getPageDecoration(),
              ),
            ],
            done: Text('Start',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                )),
            onDone: () => goToHome(context),
            showSkipButton: true,
            skip: Text('Skip'),
            onSkip: () => goToHome(context),
            next: Icon(
              Icons.arrow_forward,
            ),
            dotsDecorator: getDotDecoration(),
            onChange: (index) => print('Page $index selected'),
            globalBackgroundColor: Colors.amber[900],
            skipFlex: 0,
            nextFlex: 0,
          ),
        ),
      );

  void goToHome(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => FirebaseInitialize()),
      );

  Widget buildImage(String path) => Center(
          child: Image.asset(
        path,
        width: double.infinity,
      ));

  DotsDecorator getDotDecoration() => DotsDecorator(
        color: Colors.white,
        activeColor: Colors.white,
        size: Size(10, 10),
        activeSize: Size(28, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
        descriptionPadding: EdgeInsets.all(6).copyWith(bottom: 0),
        imagePadding: EdgeInsets.all(4),
        pageColor: Colors.green[100],
      );
}
