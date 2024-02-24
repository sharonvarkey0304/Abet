// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'package:google_fonts/google_fonts.dart';
// import 'package:loginpage/controler/firebase_auth.dart';

// import 'package:loginpage/screens/mainScreen/splash.dart';
// import 'package:loginpage/screens/userscreen/profile/youruploads.dart';

// class Profile extends StatelessWidget {
//   const Profile({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 235, 223, 115),
//         toolbarHeight: 250,
//         title: Center(
//           child: Column(children: [
//             SizedBox(
//               height: 120,
//               width: 120,
//               child: ClipRRect(
//                   borderRadius: BorderRadius.circular(300),
//                   child: Image.asset(
//                       fit: BoxFit.cover, 'assets/images/default.png')),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Text('abin',
//                 style: GoogleFonts.poppins(
//                   letterSpacing: 2,
//                   fontSize: 30,
//                   fontWeight: FontWeight.w500,
//                 )),
//           ]),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           width: MediaQuery.of(context).size.width,
//           //height: MediaQuery.of(context).size.height,
//           padding: EdgeInsets.only(top: 0),
//           decoration: BoxDecoration(
//               color: Colors.grey[200],
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(30),
//                 topRight: Radius.circular(30),
//               )),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // SizedBox(
//               //   height: 120,
//               //   width: 120,
//               //   child: ClipRRect(
//               //       borderRadius: BorderRadius.circular(300),
//               //       child: Image.asset(
//               //           fit: BoxFit.cover, 'assets/images/default.png')),
//               // ),
//               const SizedBox(
//                 height: 10,
//               ),

//               SizedBox(
//                 height: 10,
//               ),
//               // const Divider(
//               //   // height:,
//               //   // thickness:,
//               //   // indent:,
//               //   // endIndent:,
//               //   color: Colors.yellow,
//               // ),
//               SizedBox(
//                 height: 10,
//               ),
//               ListTile(
//                   leading: Container(
//                     width: 40,
//                     height: 40,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(100),
//                         color: Colors.yellow),
//                     child: const Icon(Icons.verified_user),
//                   ),
//                   title: Text('profile details'),
//                   trailing: Container(
//                     width: 30,
//                     height: 30,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(100),
//                         color: Colors.white30),
//                     child: const Icon(Icons.arrow_forward_sharp),
//                   ),
//                   onTap: () {}),
//               SizedBox(
//                 height: 10,
//               ),
//               ListTile(
//                 leading: Container(
//                   width: 40,
//                   height: 40,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(100),
//                       color: Colors.yellow),
//                   child: const Icon(Icons.upload),
//                 ),
//                 title: Text('your uploads'),
//                 trailing: Container(
//                   width: 30,
//                   height: 30,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(100),
//                       color: Colors.white30),
//                   child: const Icon(Icons.arrow_forward_sharp),
//                 ),
//                 onTap: () => Get.to(Uploads()),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               ListTile(
//                 leading: Container(
//                   width: 40,
//                   height: 40,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(100),
//                       color: Colors.yellow),
//                   child: const Icon(Icons.info_rounded),
//                 ),
//                 title: Text('info'),
//                 trailing: Container(
//                   width: 30,
//                   height: 30,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(100),
//                       color: Colors.white30),
//                   child: const Icon(Icons.arrow_forward_sharp),
//                 ),
//                 onTap: () {},
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               ListTile(
//                 leading: Container(
//                   width: 40,
//                   height: 40,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(100),
//                       color: Colors.yellow),
//                   child: const Icon(Icons.help_center),
//                 ),
//                 title: Text('help and feedback'),
//                 trailing: Container(
//                   width: 30,
//                   height: 30,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(100),
//                       color: Colors.white30),
//                   child: const Icon(Icons.arrow_forward_sharp),
//                 ),
//                 onTap: () {},
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               ListTile(
//                 leading: Container(
//                   width: 40,
//                   height: 40,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(100),
//                       color: Colors.yellow),
//                   child: const Icon(Icons.settings),
//                 ),
//                 title: Text('logout'),
//                 onTap: () {
//                   Authentication.instance.logout();
//                   Navigator.of(context).pushAndRemoveUntil(
//                       MaterialPageRoute(builder: (context) => ScreenSplash()),
//                       (route) => false);
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
