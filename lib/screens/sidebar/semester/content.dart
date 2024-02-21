import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginpage/controler/contribution_controller.dart';
import 'package:loginpage/screens/sidebar/semester/content_details.dart';
import 'package:loginpage/screens/sidebar/semester/mcq.dart/mcqScreen.dart';

class ContentScreen extends StatefulWidget {
  const ContentScreen({super.key, required this.subjectName});
  final String subjectName;

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  final contributionCntrller = Get.put(ContributionController());

  @override
  void initState() {
    contributionCntrller.setItemsInsideSubjectList(widget.subjectName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: AppBar(
            title: Text('subject shows here'),
            centerTitle: true,
          ),
        ),
        body: Column(
          children: [
            TabBar(
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.book_outlined,
                    color: Colors.black,
                  ),
                  text: 'NOTES',
                ),
                Tab(
                  icon: Icon(
                    Icons.edit,
                    color: Colors.black,
                  ),
                  text: 'M C Q',
                ),
              ],
              indicatorColor: Color.fromARGB(255, 255, 196, 59),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView.builder(
                    itemCount:
                        contributionCntrller.itemsInsideSubjectList.length,
                    itemBuilder: (context, index) {
                      final item =
                          contributionCntrller.itemsInsideSubjectList[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ContentDetailsPage(item: item,),
                              ),
                            );
                          },
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.amber.withOpacity(0.1)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        color: Colors.amber,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      item.title.toString(),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 16,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  McqScreen(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
