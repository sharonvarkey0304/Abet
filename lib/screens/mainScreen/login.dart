import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:loginpage/controler/firebase_auth.dart';
import 'package:loginpage/screens/mainScreen/questionScreen.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _email = TextEditingController();

  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          // key: _formKey,
          child: ListView(
            children: [
              Container(
                height: 330,
                width: MediaQuery.of(context).size.width, // +#
                child: Image.asset(
                  'assets/images/login.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(left: 9),
                      child: Text(
                        "Welcome 👋",
                        style: GoogleFonts.poppins(fontSize: 30),
                      ))),
              SizedBox(height: 10),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(left: 9),
                      child: Text(
                        "Sign in to your account",
                        style: GoogleFonts.poppins(fontSize: 20),
                      ))),
              const SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _email,
                      //keyboardType: TextInputType.emailAddress,
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
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _password,
                      obscureText: true,
                      //keyboardType: TextInputType.emailAddress,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              popUpBox(context);
                            },
                            child: Text(
                              'forgot password ',
                              style: GoogleFonts.poppins(),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            _signin();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors
                                .yellow, // Set the background color to yellow
                          ),
                          child: Text(
                            'LOGIN',
                            style: TextStyle(color: Colors.black),
                          ),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => QuestionScreen()));
                      },
                      child: const Text.rich(
                        TextSpan(
                            text: 'Dont have an account?  ',
                            style: TextStyle(color: Colors.black45),
                            children: [
                              TextSpan(
                                  text: 'Singn up',
                                  style: TextStyle(color: Colors.black)),
                            ]),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future popUpBox(BuildContext ctx) async {
    return showDialog(
        context: ctx,
        builder: (ctx1) {
          return AlertDialog(
            titlePadding: const EdgeInsets.only(top: 22, bottom: 5),
            actionsPadding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 8),
            contentPadding: const EdgeInsets.only(left: 20, right: 20),
            title: Center(
                child: Text('Forgot Password ?',
                    style: GoogleFonts.poppins(
                        fontSize: 28, fontWeight: FontWeight.w500))),
            actions: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 39, 183, 240),
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                          child: Text(
                        'Send Reset Link',
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      )),
                    ),
                  ),
                  const SizedBox(height: 2),
                  TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Text(
                        'Close',
                        style: GoogleFonts.poppins(),
                      ))
                ],
              )
            ],
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25))),
            content: Container(
              width: MediaQuery.of(ctx).size.width,
              height: 100,
              color: Colors.white,
              child: ListView(padding: EdgeInsets.zero, children: [
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.email,
                    ),
                    label: Text(
                      'Email Id',
                      style: GoogleFonts.poppins(),
                    ),
                  ),
                ),
              ]),
            ),
          );
        });
  }

  void _signin() async {
    String password = _password.text;
    String email = _email.text;

    Authentication.instance.signInWithEmailAndPassword(email, password);
    //Authentication.instance.setInitialScreen(user);
  }
}
