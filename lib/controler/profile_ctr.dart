import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginpage/controler/firebase_auth.dart';
import 'package:loginpage/model/user_model.dart';

class profileCtr extends GetxController {
  static profileCtr get instance => Get.find();
//

//
  final _authrep = Get.put(Authentication());
  getUserData() {
    final email = _authrep.firebaseUser.value?.email;
    if (email != null) {
      return _authrep.getUserDetails(email);
    } else {
      Get.snackbar("Error", "login to continue");
    }
  }

  updateRecord(Usermodel user) async {
    await _authrep.updateUserRecord(user);
  }
}
