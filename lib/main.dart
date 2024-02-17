import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginpage/screens/mainScreen/splash.dart';

//const SAVE_KEY_NAME = 'UserLogedIn';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      //options: DefaultFirebaseOptions.android
      options: const FirebaseOptions(
          apiKey: 'AIzaSyBZJDKm-AP1LpGwkvGAQcGYkYyCDXYA2FU',
          appId: '1:399410367882:android:cdc94145ac7450c6514c73',
          messagingSenderId: '399410367882',
          projectId: 'flutter-login-app-e6be4'));
  //.then((value) => Get.put(Authentication()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.yellow),
        home: const ScreenSplash());
  }
}
