import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonWidget {
  static void snackBar(
      {required bool isSuccsess,
      required String title,
      required String subtitle}) {
    Get.snackbar(
      title,
      subtitle,
      backgroundColor: Colors.white12,
      colorText: isSuccsess ? Colors.blue : Colors.red,
      snackPosition: SnackPosition.TOP,
      borderRadius: 30,
      margin: EdgeInsets.all(10),
      borderColor: Colors.green,
      borderWidth: 2,
      duration: Duration(seconds: 3),
    );
  }

  static Widget loadingIndicator({Color? color}) {
   return SizedBox(
      height: 15,
      width: 15,
      child: CircularProgressIndicator(
        strokeWidth: 3,
        color:color?? Colors.white,
      ),
    );
  }
}
