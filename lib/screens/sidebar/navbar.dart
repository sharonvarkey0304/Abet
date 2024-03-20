//import 'dart:convert';
//import 'dart:typed_data';

import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:loginpage/screens/sidebar/about/about.dart';
import 'package:loginpage/screens/sidebar/about/sybulls.dart';
import 'package:loginpage/screens/sidebar/contactdeveloper/contactdev.dart';

import 'package:loginpage/screens/sidebar/semester/sem.dart';
import 'package:loginpage/screens/sidebar/store/navigation.dart';
//import 'package:url_launcher/url_launcher.dart';

class Sidenav extends StatelessWidget {
  Sidenav({Key? key});

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
          ),
          ListTile(
            leading: const Icon(Icons.category_rounded),
            title: const Text('Semester'),
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
            title: const Text('Syllabus'),
            onTap: () {
               Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => Sybulls()))
                  .then((value) {
                Navigator.pop(context);
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.telegram),
            title: const Text('Join Telegram'),
            onTap: () {
              _showPictureOverlay(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About app'),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => About()))
                  .then((value) {
                Navigator.pop(context);
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.call),
            title: const Text('Contact Developers'),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => Contactdev()))
                  .then((value) {
                Navigator.pop(context);
              });
            },
          ),
        ],
      ),
    );
  }

void _showPictureOverlay(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            width: 400,
            height: 400,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/telegram.jpg',
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

