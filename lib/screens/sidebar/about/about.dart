import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginpage/screens/sidebar/contactdeveloper/dimensions.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade100,
          elevation: 0,
          titleSpacing: 0,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          title: Text(
            'About',
            style: GoogleFonts.poppins(color: Colors.black),
          ),
        ),
        body: Container(
            padding: EdgeInsets.all(Dimensions.height20),
            child: ListView(physics: const BouncingScrollPhysics(), children: [
              Text(
                '"Welcome to a world where learning knows no boundaries  ABET is your passport to a universe of knowledge. Dive into a realm where every swipe brings you closer to discovery, every tap fuels your curiosity, and every lesson ignites your passion for learning. With ABET education is not confined to classrooms its a dynamic adventure that fits in the palm of your hand. Whether youre exploring new subjects, honing your skills, or mastering new concepts, ABET is your trusted companion on the journey to academic excellence. So, seize the opportunity to transform your device into a gateway to enlightenment. ABET is a gateway to boundless opportunities and endless possibilities. With intuitive design and cutting-edge technology, weve crafted an immersive learning experience that adapts to your unique style and pace. Dive into a world of interactive lessons, engaging quizzes, and dynamic content curated by experts in every field. Whether youre a student or a lifelong learner, ABET is your trusted companion on the journey to knowledge mastery. Join our community of curious minds, where curiosity is celebrated, questions are encouraged, and discovery knows no limits. With ABET, the pursuit of knowledge is not just a destination  its an exhilarating adventure waiting to unfold.Unleash your potential, embrace the joy of learning, and let ABET be your guiding light on the path to success."',
                style: GoogleFonts.poppins(),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 20,
              ),

              //copyrights
              SizedBox(
                height: Dimensions.height25,
              ),
              // Text('Legal Licenses', style: Theme.of(context).textTheme.headline6),
              // SizedBox(
              //   height: 10,
              // ),
              // Text('This project is licensed under the Apache-2.0 License.'),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: Dimensions.height140,
                    width: Dimensions.height130,
                    child: Image.asset(
                      "assets/images/abet.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.copyright,
                        size: 15,
                      ),
                      Text(
                        ' 2024  abetoffical  |  All Rights Reserved',
                        style: GoogleFonts.poppins(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            ])
            //
            ));
  }
}
