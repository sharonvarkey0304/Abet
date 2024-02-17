import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginpage/controler/emailctr.dart';

import 'package:loginpage/screens/userscreen/userNav.dart';

class MailVarification extends StatelessWidget {
  const MailVarification({super.key});

  @override
  Widget build(BuildContext context) {
    //final controller = Get.put(MailVarificationController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 280, //
                child: Image.asset(
                  'assets/images/emailverification.gif',
                  fit: BoxFit.fill,
                ),
              ),
              GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Note: Verify your email id and tap here to continue',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Colors.lightBlue),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  onTap: () {
                    checkVerified();
                  }),
              Text(
                '(Check your email)',
                style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

checkVerified() async {
  final firebaseAuth = FirebaseAuth.instance;
  var user = firebaseAuth.currentUser!;
  await user.reload();
  user = firebaseAuth.currentUser!;
  bool flag = user.emailVerified;
  if (flag == true) {
    print('hai');
    Get.offAll(() => const UserNav());
    Get.snackbar(
      "Success",
      "Your account has been created",
      // backgroundColor: Colors.white12,
      // colorText: Colors.blue,
      // snackPosition: SnackPosition.TOP,
      // borderRadius: 30,
      // margin: EdgeInsets.all(10),
      // borderColor: Colors.green,
      // borderWidth: 2,
      // duration: Duration(seconds: 3),
    );
  } else {
    Get.put(MailVarificationController());
    //Get.snackbar("Email", "Email not verified");
  }
}
