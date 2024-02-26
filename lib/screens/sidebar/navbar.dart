import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loginpage/screens/sidebar/about/about.dart';
import 'package:loginpage/screens/sidebar/contactdeveloper/contactdev.dart';

import 'package:loginpage/screens/sidebar/semester/sem.dart';
import 'package:loginpage/screens/sidebar/store/navigation.dart';
import 'package:url_launcher/url_launcher.dart';

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
              _openPDF(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.telegram),
            title: const Text('Join Telegram'),
            onTap: () {
              _launchTelegram(context);
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

  void _launchTelegram(BuildContext context) async {
    const url = 'https://t.me/+xpa4d_YKUd0xMzhl';
    try {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Failed to open Telegram. Please try again later.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}

void _openPDF(BuildContext context) async {
  try {
    final ByteData data = await rootBundle
        .load('assets/pdf/question.pdf'); // Path to your PDF file
    final Uint8List bytes = data.buffer.asUint8List();
    await launch('data:application/pdf;base64,${base64Encode(bytes)}');
  } catch (e) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text('Failed to open PDF. Please try again later.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
