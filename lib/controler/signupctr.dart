import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginpage/controler/firebase_auth.dart';
import 'package:loginpage/model/user_model.dart';

class SignupCtr extends GetxController {
  static SignupCtr get instance => Get.find();
  final email = TextEditingController();
  final password = TextEditingController();
  final name = TextEditingController();
  final phone = TextEditingController();

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    name.dispose();
    phone.dispose();
    super.onClose();
  }

  Future<void> registeruser(String email, String password) async {
    // final auth = Authentication.instance;
    await Authentication.instance
        .createUserWithEmailAndPassword(email, password);
    // await Authentication.instance.createUser(user);
    // auth.setInitialScreen(auth.firebaseUser);
  }

  Future<void> createUser(Usermodel user) async {
    await Authentication.instance.createUser(user);
  }
}
