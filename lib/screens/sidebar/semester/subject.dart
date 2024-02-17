import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginpage/screens/sidebar/semester/content.dart';

class SubjectPage extends StatelessWidget {
  SubjectPage({Key? key}) : super(key: key);

  // List of texts for each grid item
  final List<String> gridItemTexts = [
    'Subject 1',
    'Subject 2',
    'Subject 3',
    'Subject 4',
    'Subject 5',
    'Subject 6',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bck.jpg"),
          fit: BoxFit.cover,
        ),
        //color: Colors.yellow,
      ),
      child: Column(
        children: [
          Container(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Icon(
                        Icons.arrow_back, // Replace with your desired icon
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      margin: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/bck.jpg")),
                        //color: Colors.yellow,

                        ///shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        "assets/images/abet.png",
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'SUBJECT',
                  style: GoogleFonts.poppins(color: Colors.black, fontSize: 30),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
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
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.1,
                  mainAxisSpacing: 25,
                ),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: gridItemTexts.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => ContentScreen());
                      print('Item tapped at index $index');
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 238, 241, 162),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          gridItemTexts[index], // Use text from the list
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
