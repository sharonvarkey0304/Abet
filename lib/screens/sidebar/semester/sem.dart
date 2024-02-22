import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginpage/screens/sidebar/semester/subject.dart';

import '../../../widgets/sliver_appbar.dart';

class SemesterPage extends StatelessWidget {
  SemesterPage({Key? key}) : super(key: key);

  // List of texts for each grid item
  final List<String> gridItemTexts = [
    'Semester 1',
    'Semester 2',
    'Semester 3',
    'Semester 4',
    'Semester 5',
    'Semester 6',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: ScrollPhysics(),
        slivers: [
          SliverAppBarWidget(
            image: "assets/images/bck.jpg",
            title: 'SEMESTERS',
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white24,
                        blurRadius: 10,
                        offset: Offset(2, -2),
                      )
                    ],
                  ),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.1,
                      mainAxisSpacing: 25,
                    ),
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: gridItemTexts.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(SubjectPage(semIndex: index + 1));

                          print('Item tapped at index $index');
                        },
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 238, 241, 162),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(
                              gridItemTexts[index], // Use text from the list
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
