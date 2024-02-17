import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:loginpage/screens/mainScreen/login.dart';

// ignore: use_key_in_widget_constructors
class Onboarding extends StatelessWidget {
  final intorKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    final pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w700,
      ),
      bodyTextStyle: TextStyle(fontSize: 19),
      bodyPadding: EdgeInsets.fromLTRB(16, 0, 16, 16),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );
    return IntroductionScreen(
      key: intorKey,
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
          title: "A Helping hand",
          body:
              "ABET is here to provide you with a helping hand in your learning journey, aiming to make the process easy, enjoyable, and effective.",
          image: Image.asset(
            "assets/images/screen1.png",
            width: 200,
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Empower Your Education",
          body:
              "Access a vast array of educational resources, interactive lessons, and expert guidance to unlock your full potential and achieve academic excellence.",
          image: Image.asset(
            "assets/images/screen2.png",
            width: 200,
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
            title: "Success Starts Here.",
            body:
                "Begin your journey towards success with our comprehensive educational platform, where personalized learning, skill development.",
            image: Image.asset(
              "assets/images/screen3.png",
              width: 200,
            ),
            decoration: pageDecoration,
            footer: Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 50),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ScreenLogin()));
                },
                child: const Text(
                  "Let's Start The Journey",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(55),
                    backgroundColor: Color.fromARGB(255, 255, 238, 4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
              ),
            ))
      ],
      showSkipButton: false,
      showDoneButton: false,
      showBackButton: true,
      back: Text(
        "Back",
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: Color.fromARGB(255, 255, 238, 4),
        ),
      ),
      next: Text(
        "Next",
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: Color.fromARGB(255, 255, 238, 4),
        ),
      ),
      onDone: () {},
      onSkip: () {},
      dotsDecorator: DotsDecorator(
          size: Size.square(10),
          activeSize: Size(20, 10),
          activeColor: Color.fromARGB(255, 255, 238, 4),
          color: Colors.black26,
          spacing: EdgeInsets.symmetric(horizontal: 3),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          )),
    );
  }
}
