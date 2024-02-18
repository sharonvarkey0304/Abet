import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:loginpage/controler/profile_ctr.dart';
import 'package:loginpage/model/user_model.dart';

class ProfileEdit extends StatelessWidget {
  const ProfileEdit({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: ListView(physics: const BouncingScrollPhysics(), children: [
            FutureBuilder(
              future: controller.getUserData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    Usermodel userData = snapshot.data as Usermodel;
                    final email = TextEditingController(text: userData.email);
                    final password =
                        TextEditingController(text: userData.password);
                    final name = TextEditingController(text: userData.name);
                    final phone = TextEditingController(text: userData.phone);
                    return Column(children: [
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
                          Positioned(
                              bottom: 0,
                              right: -20,
                              child: RawMaterialButton(
                                onPressed: () {},
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
                        child: Column(children: [
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
                                    final userData = Usermodel(
                                      email: email.text.trim(),
                                      password: password.text.trim(),
                                      name: name.text.trim(),
                                      phone: phone.text.trim(),
                                      id: FirebaseAuth
                                          .instance.currentUser?.uid,
                                    );
                                    await controller.updateRecord(userData);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(200, 50)),
                                  child: const Text('submit'))
                            ],
                          )
                        ]),
                      ),
                    ]);
                  } else if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  } else {
                    return const Center(child: Text('something went wrong'));
                  }
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ]),
        ),
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
