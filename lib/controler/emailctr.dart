import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:loginpage/controler/firebase_auth.dart';

class MailVarificationController extends GetxController {
  // ignore: unused_field
  late Timer _timer;
  @override
  void onInit() {
    super.onInit();
    sendVarificationEmail();
    setTimerForAutoRedirect();
  }

  Future<void> sendVarificationEmail() async {
    try {
      await Authentication.instance.sendEmailVerification();
    } catch (e) {
      Get.snackbar('error', '$e');
    }
  }

  void setTimerForAutoRedirect() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user!.emailVerified) {
        timer.cancel();
        Authentication.instance.setInitialScreen(user);
      }
    });
  }

  void manuallyCheckEmailVarification() {}
}
