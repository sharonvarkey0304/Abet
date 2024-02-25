import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginpage/controler/contribution_controller.dart';
import 'package:loginpage/screens/sidebar/semester/content.dart';
import 'package:loginpage/widgets/sliver_appbar.dart';

class SubjectPage extends StatefulWidget {
  const SubjectPage({Key? key, required this.semIndex}) : super(key: key);
  final int semIndex;

  @override
  State<SubjectPage> createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {
  final contributionCntrller = Get.put(ContributionController());

  @override
  void initState() {
    contributionCntrller.setSubjectList(widget.semIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ContributionController>(
      builder: (contributionCntrller) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.white,
          body: CustomScrollView(
            physics: ScrollPhysics(),
            slivers: [
              SliverAppBarWidget(
                image: "assets/images/bck.jpg",
                title: 'SEMESTER ${widget.semIndex}',
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                      child: contributionCntrller.subjectList.isEmpty
                          ? Center(
                              child: Text("NO SUBJECT"),
                            )
                          : GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1.1,
                                mainAxisSpacing: 25,
                              ),
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              itemCount:
                                  contributionCntrller.subjectList.length,
                              itemBuilder: (context, index) {
                                final item =
                                    contributionCntrller.subjectList[index];
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(
                                      ContentScreen(
                                        subjectName:
                                            item.subjectName.toString(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 20),
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 238, 241, 162),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Center(
                                      child: Text(
                                        item.subjectName ?? "No name",
                                        textAlign: TextAlign.center,
                                        maxLines: 4,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );

      },
    );
  }
}
