import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:loginpage/controler/signupctr.dart';
import 'package:loginpage/model/user_model.dart';
import 'package:loginpage/screens/mainScreen/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupCtr());
    final formKey = GlobalKey<FormState>();
    return Scaffold(
        body: SafeArea(
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
            child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 300,
              width: double.infinity, //MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/sign.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: const EdgeInsets.only(left: 9),
                    child: Text(
                      "Create an account",
                      style: GoogleFonts.poppins(fontSize: 30),
                    ))),
            const SizedBox(height: 10),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.name,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.person,
                        ),
                        label: Text(
                          'Username',
                          style: GoogleFonts.poppins(),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'value is empty';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: controller.phone,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.phone,
                        ),
                        label: Text(
                          'phone number',
                          style: GoogleFonts.poppins(),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'value is empty';
                    //   } else {
                    //     return null;
                    //   }
                    // },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: controller.email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.email,
                        ),
                        label: Text(
                          'Email Id',
                          style: GoogleFonts.poppins(),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'value is empty';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: controller.password,
                    obscureText: true,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                        ),
                        label: Text(
                          'Password',
                          style: GoogleFonts.poppins(),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'value is empty';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          await SignupCtr.instance.registeruser(
                              controller.email.text.trim(),
                              controller.password.text.trim());
                          String uuid =
                              FirebaseAuth.instance.currentUser?.uid ?? '-';

                          final user = Usermodel(
                            email: controller.email.text.trim(),
                            password: controller.password.text.trim(),
                            name: controller.name.text.trim(),
                            phone: controller.phone.text.trim(),
                            id: uuid,
                          );
                          await SignupCtr.instance.createUser(user);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.yellow, // Set the background color to yellow
                      ),
                      child: const Text('SIGN IN',
                          style: TextStyle(color: Colors.black)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.off(const ScreenLogin());
                    },
                    child: const Text.rich(
                      TextSpan(
                          text: 'Do you have an account?  ',
                          style: TextStyle(color: Colors.black38),
                          children: [
                            TextSpan(
                                text: 'Singn in',
                                style: TextStyle(color: Colors.black)),
                          ]),
                    ),
                  ),
                ],
              ),
            )
          ],
        )),
      ),
    ));
  }
}
