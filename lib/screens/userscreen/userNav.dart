import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:loginpage/screens/userscreen/home.dart';

import 'package:loginpage/screens/userscreen/add_contribution.dart';
import 'package:loginpage/screens/userscreen/profile_detail.dart';

class UserNav extends StatefulWidget {
  const UserNav({super.key});

  @override
  State<UserNav> createState() => _UserNavState();
}

class _UserNavState extends State<UserNav> {
  int index = 0;
  List pages = [
    ScreenHome(),
    const AddMaterial(),
    const ProfileDetail(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: GNav(
                onTabChange: (value) {
                  setState(() {
                    index = value;
                  });
                },
                // rippleColor: Colors.grey[300]!,
                // hoverColor: Colors.grey[100]!,
                gap: 8,
                activeColor: Colors.black,
                iconSize: 24,
                backgroundColor: Colors.yellow,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                //tabBackgroundColor: Color.fromARGB(255, 8, 81, 226),
                color: Colors.black26,
                tabs: const [
                  GButton(
                    icon: LineIcons.home,
                    text: "Home",
                  ),
                  // GButton(
                  //   icon: LineIcons.plusCircle,
                  //   text: "Add",
                  // ),
                  GButton(
                    icon: LineIcons.plusCircle,
                    text: "Add",
                  ),
                  GButton(
                    icon: LineIcons.user,
                    text: "Profile",
                  ),
                ],
              ),
            ),
          )
          // child: BottomNavigationBar(
          //   backgroundColor: Colors.white,
          //   selectedItemColor: Colors.red,
          //   unselectedItemColor: Colors.black,
          //   currentIndex: index,
          //   onTap: (newIndex) {
          //     setState(
          //       () {
          //         index = newIndex;
          //       },
          //     );
          //   },
          //   items: const <BottomNavigationBarItem>[
          //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          //     BottomNavigationBarItem(icon: Icon(Icons.add), label: 'add'),
          //     BottomNavigationBarItem(icon: Icon(Icons.person), label: 'person'),
          //   ],
          // ),
          ),
    );
  }
}
