import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginpage/screens/sidebar/contactdeveloper/dimensions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Contactdev extends StatefulWidget {
  const Contactdev({super.key});

  @override
  State<Contactdev> createState() => _ScreenState();
}

class _ScreenState extends State<Contactdev> {
  //
  // variable controller
  var controller1;
  var controller2;

  //image urls
  String jibi =
      'https://firebasestorage.googleapis.com/v0/b/qstart-ec938.appspot.com/o/Additional%20Images%2Fjibi.png?alt=media&token=f62bd183-bfb5-473e-816b-b4021f8a94a7';
  String asish =
      'https://firebasestorage.googleapis.com/v0/b/qstart-ec938.appspot.com/o/Additional%20Images%2Fasish.png?alt=media&token=bd941413-8813-42b0-8ec9-901589b6dad5';
  String reniemam =
      'https://firebasestorage.googleapis.com/v0/b/qstart-ec938.appspot.com/o/Additional%20Images%2Freniemam.png?alt=media&token=17dfc87b-a8cf-45ba-929c-75d6f3a2575c';
  String Adithyan =
      'https://firebasestorage.googleapis.com/v0/b/qstart-ec938.appspot.com/o/Additional%20Images%2FAdithyan.png?alt=media&token=5c060505-51a9-407b-9432-fd38f8228ca2';
  String Jerome =
      'https://firebasestorage.googleapis.com/v0/b/qstart-ec938.appspot.com/o/Additional%20Images%2FJerome.png?alt=media&token=ae2d401f-e33e-480e-95c7-c1571608511f';

  String IR =
      'https://firebasestorage.googleapis.com/v0/b/qstart-ec938.appspot.com/o/Additional%20Images%2FIR.png?alt=media&token=807a1958-6744-495c-8542-c0fb638dade3';
  String ansam =
      'https://firebasestorage.googleapis.com/v0/b/qstart-ec938.appspot.com/o/Additional%20Images%2Fansam.png?alt=media&token=8919ead1-909e-4d87-b153-d9c2580105ac';
  String Laiju =
      'https://firebasestorage.googleapis.com/v0/b/qstart-ec938.appspot.com/o/Additional%20Images%2Flaiju.png?alt=media&token=bcc72408-9286-4ee4-b026-67d7c0d6339c';

  @override
  void initState() {
    controller1 = PageController(
        // viewportFraction:0.8,
        );
    controller2 = PageController(
        // viewportFraction:0.8,
        );
    super.initState();
  }

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
            'Contact Us',
            style: GoogleFonts.poppins(color: Colors.black),
          ),
        ),
        body: Container(
            padding: EdgeInsets.all(Dimensions.height20),
            child: ListView(physics: const BouncingScrollPhysics(), children: [
              Text('Why Behind Us?',
                  style: GoogleFonts.poppins(
                      fontSize: Dimensions.height20,
                      fontWeight: FontWeight.w700)),
              SizedBox(
                height: Dimensions.height10,
              ),
              Text(
                '"Embark on a journey of endless learning with ABET. Every tap, every lesson, every moment is an opportunity to grow, to expand your knowledge, and to unlock your full potential. Let curiosity be your compass, and let ABET be your guide as you explore the vast realms of knowledge. With dedication and perseverance, there are no limits to what you can achieve. Embrace the power of education, and let it illuminate the path to your dreams. Start today, and watch as your mind blossoms with wisdom and possibility".',
                style: GoogleFonts.poppins(),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                  child: Text(
                'Coded with ❤️',
                style: GoogleFonts.poppins(
                    fontSize: Dimensions.height14, fontWeight: FontWeight.w500),
              )),
              Text(
                'Developed By: ',
                style: GoogleFonts.poppins(),
              ),
              //developer view
              SizedBox(
                height: Dimensions.height200,
                // pageview
                child: PageView(
                  // onPageChanged: (value){
                  //  print(controller1);
                  // },
                  physics: const BouncingScrollPhysics(),
                  controller: controller1,
                  children: <Widget>[
                    DeveloperCard(
                        jibi,
                        'Asst.professor Priya Peter',
                        // 'Learning to code is learning to create and innovate',
                        'Team Lead',
                        context),
                    DeveloperCard(
                        reniemam,
                        'Sharon Varkey',
                        // 'Words don\'t matter unless your work says what you do',
                        'Frontend Developer',
                        context),
                    DeveloperCard(
                        asish,
                        'Abin Saji',
                        // 'Communicating your problems is the key to improvement',
                        'Backend Developer',
                        context),
                    DeveloperCard(
                        Jerome,
                        'Goury Nanda V',
                        // 'We have been working on this application with all our determination',
                        'UI/UX Designer',
                        context),
                    // DeveloperCard(
                    //     Adithyan,
                    //     'Adithyan N S',
                    //     // 'Programming isn\'t about waht you know, It\' about what you can figure out',
                    //     'Content Creator',
                    //     context),
                  ],
                ),
              ),
              Center(
                child: SmoothPageIndicator(
                    controller: controller1,
                    count: 4,
                    effect: ExpandingDotsEffect(
                      dotWidth: Dimensions.width10,
                      dotHeight: Dimensions.height10,
                      dotColor: Colors.grey.shade400,
                    )),
              ),
              // SizedBox(height: Dimensions.height20,),
              // //special thanks to
              // Text('Special Thanks to :',style: GoogleFonts.poppins(),),
              // SizedBox(
              //   height: Dimensions.height200,
              //   // pageview
              //   child: PageView(
              //       physics: const BouncingScrollPhysics(),
              //     controller: controller2,
              //     children: <Widget>[
              //       DeveloperCard(
              //          IR,
              //           'Indrajith arb',
              //           // 'Learning to code is learning to create and innovate',
              //           'UI/UX Designer',
              //           context),

              //       DeveloperCard(
              //         Laiju,
              //           'Laiju George',
              //           // 'Communicating your problems is the key to improvement',
              //           'Developer',
              //           context),
              //       DeveloperCard(
              //           ansam,
              //           'Ansam CD',
              //           // 'We have been working on this application with all our determination',
              //           'Flutter Developer',
              //           context),

              //     ],
              //   ),
              // ),
              // Center(
              //   child: SmoothPageIndicator(
              //       controller: controller2,
              //       count: 3,
              //       effect: ExpandingDotsEffect(
              //         dotWidth: Dimensions.width10,
              //         dotHeight: Dimensions.height10,
              //         dotColor: Colors.grey.shade400,

              //       )),
              // ),

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

  Padding DeveloperCard(
      String img, String name, String description, BuildContext context) {
    return Padding(
        // padding: const EdgeInsets.all(14.0),
        padding: EdgeInsets.only(top: 12, bottom: 7, left: 2, right: 2),
        child: Container(
          height: Dimensions.height130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  // spreadRadius: 0.7,
                  blurRadius: Dimensions.height10,
                  offset: Offset(2, -2))
            ],
            color: Colors.white,
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(Dimensions.height80),
                  // child: FadeInImage(
                  //   width: Dimensions.width90,
                  //     height: Dimensions.height100,
                  //     fit: BoxFit.fill,
                  //     placeholder: AssetImage('assets/images/imageloading.gif'),
                  //    image: NetworkImage(
                  //     img,

                  //   ),
                  // ),
                ),
              ),
              Container(
                height: Dimensions.height55,
                width: MediaQuery.of(context).size.width - 194,
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Text(
                      name,
                      //'We believe technology should be used in favour of mankind wherever possible. As students, we are the future builders and we are responsible for our own competency with the world.',
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: Dimensions.height2,
                    ),
                    Text(
                      description,
                      style: GoogleFonts.poppins(
                          color: Colors.grey.shade700,
                          fontSize: Dimensions.height14,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
              ),
              SizedBox(width: Dimensions.height10)
            ],
          ),
        ));
  }
}
