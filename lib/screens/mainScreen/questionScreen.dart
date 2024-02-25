import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginpage/screens/mainScreen/signup.dart';

import '../../controler/signupctr.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<QuestionScreen> {
  final signupControllr = Get.put(SignupCtr());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SignupCtr>(builder: (controller) {
        return SafeArea(
          child: Form(
            child: ListView(
              children: [
                SizedBox(
                  height: 330,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'assets/images/book.jpg',
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
                      " Select your",
                      style: GoogleFonts.poppins(fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 9),
                    child: Text(
                      "    Course",
                      style: GoogleFonts.poppins(fontSize: 30),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                RadioListTile<Course>(
                  title: Text("BCA"),
                  value: Course.BCA,
                  groupValue: controller.selectedCourse,
                  onChanged: (Course? value) {
                    if (value != null) {
                      controller.setSelectedCourse(value: value);
                    }
                  },
                  activeColor: Colors.yellow,
                ),
                RadioListTile<Course>(
                  title: Text("BBA"),
                  value: Course.BBA,
                  groupValue: controller.selectedCourse,
                  onChanged: (Course? value) {
                    if (value != null) {
                      controller.setSelectedCourse(value: value);
                    }
                  },
                  activeColor: Colors.yellow,
                ),
                RadioListTile<Course>(
                  title: Text("BSC Biology"),
                  value: Course.BSC,
                  groupValue: controller.selectedCourse,
                  onChanged: (Course? value) {
                    if (value != null) {
                      controller.setSelectedCourse(value: value);
                    }
                  },
                  activeColor: Colors.yellow,
                  // visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                ),
                const SizedBox(height: 30),
                TextButton(
                  onPressed: () {
                    Get.to(SignUp.new);
                  },
                  child: const Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      'NEXT',
                      style: TextStyle(
                        color: Color.fromARGB(183, 255, 154, 59),
                        fontSize: 18,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
