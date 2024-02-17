import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loginpage/model/user_model.dart';
import 'package:loginpage/screens/mainScreen/emailVarification.dart';

import 'package:loginpage/screens/mainScreen/onboarding1.dart';
import 'package:loginpage/screens/userscreen/userNav.dart';

class Authentication extends GetxController {
  static Authentication get instance => Get.find();
  final _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;
  late final Rx<User?> firebaseUser;
  @override
  void onReady() {
    //ScreenSplash.remove();
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    setInitialScreen(firebaseUser.value);
    //ever(firebaseUser, _setInitialScreen);
  }

  setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => Onboarding())
        : user.emailVerified
            ? Get.offAll(() => const UserNav())
            : Get.offAll(() => const MailVarification());
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      Get.offAll(() => const MailVarification());
      // Get.offAll(() => const UserVav());
    } catch (e) {
      Get.snackbar(
        "Error",
        "$e",
        backgroundColor: Colors.red,
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 30,
        margin: EdgeInsets.all(10),
        borderColor: Colors.green,
        borderWidth: 2,
        duration: Duration(seconds: 3),
      );
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      Get.offAll(() => const UserNav());
      Get.snackbar("Welcome", "Successfully logged in");

      //Get.offAll(() => const UserVav());
    } catch (e) {
      Get.snackbar(
        "Error",
        "$e",
        backgroundColor: Colors.white12,
        colorText: Colors.red,
        snackPosition: SnackPosition.TOP,
        borderRadius: 30,
        margin: EdgeInsets.all(10),
        borderColor: Colors.green,
        borderWidth: 2,
        duration: Duration(seconds: 3),
      );
    }
  }

  Future<void> logout() async => await _auth.signOut();
//
//store data in firebase

  createUser(Usermodel user) async {
    await _db.collection("Users").add(user.toJson()).then((_) {
      Get.snackbar("Email", "Tap to varify your email");
    }).catchError((error, stackTrace) {
      Get.snackbar(
        "Error",
        "Something went wrong",
        backgroundColor: Colors.white12,
        colorText: Colors.red,
        snackPosition: SnackPosition.TOP,
        borderRadius: 30,
        margin: EdgeInsets.all(10),
        borderColor: Colors.green,
        borderWidth: 2,
        duration: Duration(seconds: 3),
      );
    });
  }

  Future<Usermodel> getUserDetails(String email) async {
    final snapshot =
        await _db.collection("Users").where("Email", isEqualTo: email).get();
    final userdata = snapshot.docs.map((e) => Usermodel.fromSnapshot(e)).single;
    return userdata;
  }

  Future<void> UpdateUserRecord(Usermodel user) async {
    //doc(user.id)
    await _db.collection("Users").doc(user.id).update(user.toJson()).then((_) {
      Get.snackbar(
        "Success",
        "Your account has been changed",
        backgroundColor: Colors.white12,
        colorText: Colors.blue,
        snackPosition: SnackPosition.TOP,
        borderRadius: 30,
        margin: EdgeInsets.all(10),
        borderColor: Colors.green,
        borderWidth: 2,
        duration: Duration(seconds: 3),
      );
    }).catchError((error, stackTrace) {
      Get.snackbar(
        "Error",
        "$error",
        backgroundColor: Colors.white12,
        colorText: Colors.red,
        snackPosition: SnackPosition.TOP,
        borderRadius: 30,
        margin: EdgeInsets.all(10),
        borderColor: Colors.green,
        borderWidth: 2,
        duration: Duration(seconds: 3),
      );
    });
  }

  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } catch (e) {
      Get.snackbar(
        "Error",
        "$e",
        backgroundColor: Colors.white12,
        colorText: Colors.red,
        snackPosition: SnackPosition.TOP,
        borderRadius: 30,
        margin: EdgeInsets.all(10),
        borderColor: Colors.green,
        borderWidth: 2,
        duration: Duration(seconds: 3),
      );
    }
  }

  // Future<List<Usermodel>> allUser() async {
  //   final snapshot = await _db.collection("Users").get();
  //   final userdata =
  //       snapshot.docs.map((e) => Usermodel.fromSnapshot(e)).toList();
  //   return userdata;
  // }
}
