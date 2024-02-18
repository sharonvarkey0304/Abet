import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:loginpage/controler/firebase_auth.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({Key? key})
      : super(
          key: key,
        );

  @override
  State<ScreenSplash> createState() => _Screen1State();
}

class _Screen1State extends State<ScreenSplash>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    
      Get.put(Authentication());
    }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 238, 4),
        body: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(horizontal: 42),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 5,
              ),
              Image.asset(
                'assets/images/logo.png',
                height: 500.roundToDouble(),
                width: 500.roundToDouble(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
