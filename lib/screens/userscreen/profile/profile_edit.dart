import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:loginpage/controler/profile_ctr.dart';
import 'package:loginpage/model/user_model.dart';

import '../../../widgets/snackbar.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();

  final controller = Get.put(ProfileController());
  Usermodel? userData;

  @override
  void initState() {
    userData = controller.userData!;
    email = TextEditingController(text: userData?.email);
    password = TextEditingController(text: userData?.password);
    name = TextEditingController(text: userData?.name);
    phone = TextEditingController(text: userData?.phone);
    controller.selectedImage = userData?.userImage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                              child: controller.isImageLoading
                                  ? Center(
                                      child: CommonWidget.loadingIndicator(
                                          color: Colors.amber))
                                  : controller.selectedImage == null
                                      ? Image.asset(
                                          fit: BoxFit.cover,
                                          'assets/images/default.png')
                                      : Image.network(
                                          controller.selectedImage ?? "",
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Image.asset(
                                                fit: BoxFit.cover,
                                                'assets/images/default.png');
                                          },
                                        )),
                        ),
                        Positioned(
                            bottom: 0,
                            right: -20,
                            child: RawMaterialButton(
                              onPressed: () {
                                controller.pickImage();
                              },
                              elevation: 2.0,
                              fillColor: const Color(0xFFF5F6F9),
                              padding: const EdgeInsets.all(10.0),
                              shape: const CircleBorder(),
                              child: const Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.black,
                              ),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          TextFormField(
                            //initialValue: userData.name,
                            controller: name,
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
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            // initialValue: userData.email,
                            controller: email,
                            readOnly: true,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.email,
                                ),
                                label: Text(
                                  'Email',
                                  style: GoogleFonts.poppins(),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15))),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            // initialValue: userData.phone,
                            controller: phone,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.phone,
                                ),
                                label: Text(
                                  'Phone no',
                                  style: GoogleFonts.poppins(),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15))),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            // initialValue: userData.password,
                            controller: password,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.lock,
                                ),
                                label: Text(
                                  'Password',
                                  style: GoogleFonts.poppins(),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15))),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  onPressed: () async {
                                    final userdata = Usermodel(
                                        email: email.text.trim(),
                                        password: password.text.trim(),
                                        name: name.text.trim(),
                                        phone: phone.text.trim(),
                                        userImage: controller.selectedImage,
                                        id: FirebaseAuth
                                            .instance.currentUser?.uid,
                                        course: userData?.course ?? "");
                                    await controller.updateRecord(userdata);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(200, 50)),
                                  child: controller.isSubmitLoading
                                      ? CommonWidget.loadingIndicator()
                                      : const Text('submit'))
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:loginpage/controler/profile_ctr.dart';
// import 'package:loginpage/model/user_model.dart';

// class Profile_edit extends StatelessWidget {
//   Profile_edit({super.key});
//   final controller = Get.put(profileCtr());
//   //final _auth = FirebaseAuth.instance;

// @override
// Widget build(BuildContext context) {
//   // final _formKey = GlobalKey<FormState>();
//   return Scaffold(
//     appBar: AppBar(),
//     body: Form(
//       // key: _formKey,
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             Text(
//               'Edit',
//               style: GoogleFonts.poppins(
//                   letterSpacing: 15, fontSize: 40, fontWeight: FontWeight.bold),
//             ),
//             Text(
//               'Your Profile',
//               style: GoogleFonts.poppins(
//                 fontSize: 25,
//               ),
//             ),
//             const SizedBox(
//               height: 40,
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Column(children: [
//                 TextFormField(
//                   //controller: controller.Name,
//                   decoration: InputDecoration(
//                       prefixIcon: const Icon(
//                         Icons.person,
//                       ),
//                       label: Text(
//                         'Username',
//                         style: GoogleFonts.poppins(),
//                       ),
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(15))),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'value is empty';
//                     } else {
//                       return null;
//                     }
//                   },
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 TextFormField(
//                   controller: controller.Email,
//                   keyboardType: TextInputType.emailAddress,
//                   decoration: InputDecoration(
//                       prefixIcon: const Icon(
//                         Icons.email,
//                       ),
//                       label: Text(
//                         'Email',
//                         style: GoogleFonts.poppins(),
//                       ),
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(15))),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'value is empty';
//                     } else {
//                       return null;
//                     }
//                   },
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 TextFormField(
//                   controller: controller.Phone,
//                   keyboardType: TextInputType.phone,
//                   decoration: InputDecoration(
//                       prefixIcon: const Icon(
//                         Icons.phone,
//                       ),
//                       label: Text(
//                         'Phone no',
//                         style: GoogleFonts.poppins(),
//                       ),
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(15))),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'value is empty';
//                     } else {
//                       return null;
//                     }
//                   },
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 TextFormField(
//                   controller: controller.Password,
//                   decoration: InputDecoration(
//                       prefixIcon: const Icon(
//                         Icons.lock,
//                       ),
//                       label: Text(
//                         'Password',
//                         style: GoogleFonts.poppins(),
//                       ),
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(15))),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'value is empty';
//                     } else {
//                       return null;
//                     }
//                   },
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     ElevatedButton(
//                         onPressed: () async {
//                           editValidation();
//                           //await _auth.currentUser
//                           //?.reauthenticateWithCredential(userData);
//                         },
//                         style:
//                             ElevatedButton.styleFrom(fixedSize: Size(200, 50)),
//                         child: Text('submit'))
//                   ],
//                 )
//               ]),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }

//   editValidation() async {
//     if (controller.Email.text == '' ||
//         controller.Name.text == '' ||
//         controller.Password.text == '' ||
//         controller.Phone.text == '') {
//       Get.snackbar('Oops', 'Fields are empty');
//       return;
//     }

//     if (controller.Password.text == '') {
//       Get.snackbar('Warning', 'Enter your password');
//       return;
//     } else {
//       final userData = Usermodel(
//           email: controller.Email.text.trim(),
//           password: controller.Password.text.trim(),
//           name: controller.Name.text.trim(),
//           phone: controller.Phone.text.trim());
//       await controller.updateRecord(userData);
//     }
//   }
// }
