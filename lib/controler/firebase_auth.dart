import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loginpage/model/user_model.dart';
import 'package:loginpage/screens/mainScreen/emailVarification.dart';

import 'package:loginpage/screens/mainScreen/onboarding1.dart';
import 'package:loginpage/screens/userscreen/userNav.dart';
import 'package:loginpage/widgets/snackbar.dart';

class Authentication extends GetxController {
  static Authentication get instance => Get.find();
  final _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;
  late final Rx<User?> firebaseUser;
  @override
  void onInit() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    setInitialScreen(firebaseUser.value);
    super.onInit();
  }

  // @override
  // void onReady() {
  //   //ScreenSplash.remove();
  //   log("called");
  //   firebaseUser = Rx<User?>(_auth.currentUser);
  //   firebaseUser.bindStream(_auth.userChanges());
  //   setInitialScreen(firebaseUser.value);
  //   //ever(firebaseUser, _setInitialScreen);
  // }

  setInitialScreen(User? user) {
    Future.delayed(
      Duration(seconds: 3),
      () {
        user == null
            ? Get.offAll(Onboarding.new)
            : user.emailVerified
                ? Get.offAll(() => const UserNav())
                : Get.offAll(() => const MailVarification());
      },
    );
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
        margin: const EdgeInsets.all(10),
        borderColor: Colors.green,
        borderWidth: 2,
        duration: const Duration(seconds: 3),
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
      log('credentials:\nemail:$email \npassword: $password');
      log('eror in login: $e');
      Get.snackbar(
        "Error",
        "$e",
        backgroundColor: Colors.white12,
        colorText: Colors.red,
        snackPosition: SnackPosition.TOP,
        borderRadius: 30,
        margin: const EdgeInsets.all(10),
        borderColor: Colors.green,
        borderWidth: 2,
        duration: const Duration(seconds: 3),
      );
    }
  }

  Future<void> logout() async => await _auth.signOut();
//
//store data in firebase

  createUser(Usermodel user) async {
    String uuid = _auth.currentUser?.uid ?? '-';

    await _db.collection("Users").doc(uuid).set(user.toJson()).then((_) {
      Get.snackbar("Email", "Tap to varify your email");
    }).catchError((error, stackTrace) {
      Get.snackbar(
        "Error",
        "Something went wrong",
        backgroundColor: Colors.white12,
        colorText: Colors.red,
        snackPosition: SnackPosition.TOP,
        borderRadius: 30,
        margin: const EdgeInsets.all(10),
        borderColor: Colors.green,
        borderWidth: 2,
        duration: const Duration(seconds: 3),
      );
    });
  }

  Future<Usermodel?> getUserDetails(String email) async {
    try {
      final snapshot =
          await _db.collection("Users").where("Email", isEqualTo: email).get();
      if (snapshot.docs.isNotEmpty) {
        // If there are documents matching the query, return the first one
        final userdata = Usermodel.fromSnapshot(snapshot.docs.first);
        return userdata;
      } else {
        // If no documents match the query criteria, return null or handle the case accordingly
        return null;
      }
    } catch (e) {
      log("Error: $e");
      rethrow;
    }
  }

  Future<void> updateUserRecord(Usermodel user) async {
    //doc(user.id)

    String uuid = _auth.currentUser?.uid ?? '-';
    try {
      await _auth.currentUser?.updatePassword(user.password);
      await _db
          .collection("Users")
          .doc(uuid)
          .update(user.toJson())
          .then((_) async {
        Get.snackbar(
          "Success",
          "Your account has been changed",
          backgroundColor: Colors.white12,
          colorText: Colors.blue,
          snackPosition: SnackPosition.TOP,
          borderRadius: 30,
          margin: const EdgeInsets.all(10),
          borderColor: Colors.green,
          borderWidth: 2,
          duration: const Duration(seconds: 3),
        );
      }).catchError((error, stackTrace) {
        Get.snackbar(
          "Error",
          "$error",
          backgroundColor: Colors.white12,
          colorText: Colors.red,
          snackPosition: SnackPosition.TOP,
          borderRadius: 30,
          margin: const EdgeInsets.all(10),
          borderColor: Colors.green,
          borderWidth: 2,
          duration: const Duration(seconds: 3),
        );
      });
    } catch (e) {
      log('error on updating user profile: $e');
    }
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
        margin: const EdgeInsets.all(10),
        borderColor: Colors.green,
        borderWidth: 2,
        duration: const Duration(seconds: 3),
      );
    }
  }

  Future<void> resetPassword({required String email}) async {
    await _auth.sendPasswordResetEmail(email: email).then((_) {
      log("success ");
      CommonWidget.snackBar(
        isSuccsess: true,
        title: "Send a link to your email",
        subtitle: "Click the link and change the password.",
      );
    }).catchError((e) {
      log("error e");
      CommonWidget.snackBar(
        isSuccsess: false,
        title: "Error",
        subtitle: "Entered Email is not registered.",
      );
    });
  }

  // Future<List<Usermodel>> allUser() async {
  //   final snapshot = await _db.collection("Users").get();
  //   final userdata =
  //       snapshot.docs.map((e) => Usermodel.fromSnapshot(e)).toList();
  //   return userdata;
  // }
}
