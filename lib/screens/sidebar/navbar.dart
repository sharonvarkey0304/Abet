import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginpage/controler/store_controller.dart';
import 'package:loginpage/screens/sidebar/semester/sem.dart';
import 'package:loginpage/screens/sidebar/store/navigation.dart';

class Sidenav extends StatelessWidget {
  Sidenav({super.key});

  // injecting store controller
  // ignore: unused_field
  final _storeController = Get.put(StoreController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(width: 0)),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/book.jpg'),
              ),
            ),
            child: null,
            //accountName: Text('ABET'),
            //accountEmail: Text('Learn With Us'),
            // currentAccountPicture: Stack(
            //   children: [
            //     Container(
            //       height: 190,
            //       width: 170,
            //       child: ClipRRect(
            //           borderRadius: BorderRadius.circular(300),
            //           child: Image.asset(
            //               fit: BoxFit.cover, 'assets/images/logo.png')),
            //     ),
            //   ],
            // ),
          ),
          ListTile(
            leading: const Icon(Icons.category_rounded),
            title: const Text('semester'),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => SemesterPage()))
                  .then((value) {
                Navigator.pop(context);
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.store),
            title: const Text('Store'),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => NavigationScreen()))
                  .then((value) {
                Navigator.pop(context);
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.book_online),
            title: const Text('syllabus'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.telegram),
            title: const Text('Join telegram'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About app'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.call),
            title: const Text('Contact Developers'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
