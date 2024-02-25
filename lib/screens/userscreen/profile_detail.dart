import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginpage/controler/firebase_auth.dart';
import 'package:loginpage/controler/profile_ctr.dart';
import 'package:loginpage/model/user_model.dart';
import 'package:loginpage/screens/mainScreen/login.dart';
import 'package:loginpage/screens/userscreen/profile/profile_edit.dart';
import 'package:loginpage/screens/userscreen/profile/youruploads.dart';
import 'package:loginpage/widgets/snackbar.dart';

class ProfileDetail extends StatefulWidget {
  const ProfileDetail({super.key});

  @override
  State<ProfileDetail> createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(surfaceTintColor: Colors.transparent
          // actions: [
          //   IconButton(
          //       onPressed: () {
          //         // Navigator.push(
          //         //     context, MaterialPageRoute(builder: (context) => Store()));
          //       },
          //       icon: const Icon(Icons.add_box_outlined)),
          //   IconButton(
          //       onPressed: () {
          //         // Navigator.push(
          //         //     context, MaterialPageRoute(builder: (context) => Store()));
          //       },
          //       icon: const Icon(Icons.info)),
          // ],
          ),
      body: GetBuilder<ProfileController>(
        builder: (controller) {
          if (controller.userProfileStatus == UserProfileStatus.loading) {
            return Center(
              child: CommonWidget.loadingIndicator(color: Colors.amber),
            );
          } else if (controller.userProfileStatus == UserProfileStatus.error) {
            return Center(
              child: Text("Something went wrong"),
            );
          }
          Usermodel? userData = controller.userData;
          if (userData == null) {
            return Center(
              child: Text("Something went wrong"),
            );
          }
          return Container(
            color: Colors.white,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: 190,
                          width: 170,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(300),
                              child: Image.asset(
                                  fit: BoxFit.cover,
                                  'assets/images/default.png')),
                        ),
                        // Positioned(
                        //     bottom: 0,
                        //     right: -20,
                        //     child: RawMaterialButton(
                        //       onPressed: () {},
                        //       elevation: 2.0,
                        //       fillColor: const Color(0xFFF5F6F9),
                        //       padding: const EdgeInsets.all(10.0),
                        //       shape: const CircleBorder(),
                        //       child: const Icon(
                        //         Icons.camera_alt_outlined,
                        //         color: Colors.black,
                        //       ),
                        //     )),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(userData.name,
                        style: GoogleFonts.poppins(
                          letterSpacing: 2,
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: ElevatedButton(
                              onPressed: () {
                                Get.to(ProfileEdit.new);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors
                                    .yellow, // Change the color to your desired color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      0), // Set borderRadius to 0 for a square button
                                ),
                              ),
                              child: Text('EDIT PROFILE',
                                  style: TextStyle(color: Colors.black))),
                        )),
                        // SizedBox(
                        //   width: 7,
                        // ),
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: ElevatedButton(
                            onPressed: () {
                              Get.to(Uploads.new);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors
                                  .yellow, // Change the color to your desired color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    0), // Set borderRadius to 0 for a square button
                              ),
                            ),
                            child: Text('YOUR UPLOADS',
                                style: TextStyle(color: Colors.black)),
                          ),
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    card(
                        title: 'E-mail',
                        content: userData.email,
                        cardicon: const Icon(Icons.mail)),
                    card(
                        title: 'Phone no',
                        content: userData.phone,
                        cardicon: const Icon(Icons.phone)),
                    card(
                        title: 'course',
                        content: userData.course,
                        cardicon: const Icon(Icons.school)),
                    // card(
                    //     title: 'password',
                    //     content: userData.password,
                    //     cardicon: const Icon(Icons.lock)),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      leading: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.yellow),
                        child: const Icon(Icons.help),
                      ),
                      title: Text('help and support'),
                      trailing: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white30),
                        child: const Icon(Icons.arrow_forward_sharp),
                      ),
                      onTap: () {},
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      leading: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.yellow),
                        child: const Icon(Icons.feedback),
                      ),
                      title: Text('feedback'),
                      trailing: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white30),
                        child: const Icon(Icons.arrow_forward_sharp),
                      ),
                      onTap: () {},
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      leading: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.yellow),
                        child: const Icon(Icons.exit_to_app_rounded),
                      ),
                      title: Text('logout'),
                      onTap: () {
                        showLogoutDialog(context);
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Card card({String? title, String? content, Icon? cardicon}) {
    return Card(
      color: Color.fromARGB(255, 244, 245, 245),
      elevation: 1,
      margin: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Padding(
          padding: EdgeInsets.all(10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title!,
                style: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 126, 124, 124))),
            SizedBox(height: 5),
            Row(children: [
              cardicon!,
              SizedBox(width: 5),
              Text(content!, style: GoogleFonts.poppins()),
            ]),
          ])),
    );
  }

  void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text('Logout')),
          content: Text('Do you want to log out?'),
          actions: [
            TextButton(
              onPressed: () {
                Authentication.instance.logout();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => ScreenLogin()),
                    (route) => false);
              },
              child: Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('No'),
            ),
          ],
        );
      },
    );
  }
}
