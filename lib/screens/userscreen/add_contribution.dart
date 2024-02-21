import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:loginpage/controler/contribution_controller.dart';
import 'package:loginpage/model/contribution_model.dart';
import 'package:uuid/uuid.dart';

class AddMaterial extends StatefulWidget {
  const AddMaterial({Key? key}) : super(key: key);

  @override
  State<AddMaterial> createState() => _AddMaterialState();
}

class _AddMaterialState extends State<AddMaterial> {
  final contributionController = Get.put(ContributionController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<ContributionController>(builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 330,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'assets/images/add.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(right: 25, left: 25),
                    child: Text(
                      ' ADD YOUR CONTRIBUTION',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30, right: 25, left: 25),
                      child: TextFormField(
                        controller: contributionController.titleController,
                        decoration: InputDecoration(
                          labelText: 'Title',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30, right: 25, left: 25),
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Semester',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        items: <String>['1', '2', '3', '4', '5', '6']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            contributionController.semesterController.text =
                                newValue;
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30, right: 25, left: 25),
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Subject',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        items: <String>['c', 'html', 'java', 'php']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            contributionController.subjectController.text =
                                newValue;
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: TextFormField(
                        maxLines: 4,
                        controller: contributionController.detailsController,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          labelText: 'Details',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Stack(
                        children: [
                          //image container
                          SizedBox(
                            height: 190,
                            width: 170,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: contributionController.image != null
                                  ? Image.file(
                                      File(contributionController.image ?? ""),
                                      fit: BoxFit.cover,
                                    )
                                  : Image.asset(
                                      'assets/images/nophoto.png',
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),

                          //image add icon
                          Positioned(
                            top: 140,
                            left: 120,
                            child: IconButton(
                              onPressed: () async {
                                await contributionController.pickImage();
                              },
                              icon: const Icon(
                                FontAwesomeIcons.cameraRetro,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4))),
                        onPressed: () {
                          List<Subject>? subjectTempList = [];
                          List<Semester>? semesterTemplist = [];

                          if (contributionController.subjectList.any(
                              (element) =>
                                  element.subjectName ==
                                  contributionController
                                      .subjectController.text)) {
                            log("first");
                            subjectTempList = contributionController.subjectList
                                .firstWhere((element) =>
                                    element.subjectName ==
                                    contributionController
                                        .subjectController.text)
                                .subject;
                            subjectTempList?.clear();
                            subjectTempList?.add(Subject(
                              id: Uuid().v4(),
                              details:
                                  contributionController.detailsController.text,
                              imageBase64: "11111",
                              title:
                                  contributionController.titleController.text,
                            ));
                          } else {
                            log("second");
                            subjectTempList = [
                              Subject(
                                id: Uuid().v4(),
                                details: contributionController
                                    .detailsController.text,
                                imageBase64: "11111",
                                title:
                                    contributionController.titleController.text,
                              )
                            ];
                          }

                          if (contributionController.contributionList.any(
                              (element) =>
                                  element.semesterName ==
                                  contributionController
                                      .semesterController.text)) {
                            semesterTemplist = contributionController
                                .contributionList
                                .firstWhere((element) =>
                                    element.semesterName ==
                                    contributionController
                                        .semesterController.text)
                                .semester;
                            semesterTemplist?.add(Semester(
                              subjectName:
                                  contributionController.subjectController.text,
                              subject: subjectTempList,
                            ));
                          } else {
                            semesterTemplist = [
                              Semester(
                                subjectName: contributionController
                                    .subjectController.text,
                                subject: subjectTempList,
                              )
                            ];
                          }

                          contributionController.contributionList.add(
                            ContributionDatum(
                                id: Uuid().v1(),
                                semesterName: contributionController
                                    .semesterController.text,
                                semester: semesterTemplist),
                          );

                          // contributionController.contributionList
                          //       .add(ContributionDatum(
                          //     id: Uuid().v1(),
                          //     semesterName: contributionController
                          //         .semesterController.text,
                          //     semester: [
                          //       Semester(
                          //         subjectName: contributionController
                          //             .subjectController.text,
                          //         subject: [
                          //           Subject(
                          //             id: Uuid().v4(),
                          //             details: contributionController
                          //                 .detailsController.text,
                          //             imageBase64: "11111",
                          //             title: contributionController
                          //                 .titleController.text,
                          //           )
                          //         ],
                          //       )
                          //     ],
                          //   ));

                          contributionController.setContributiontoFirestore(
                              contributionList:
                                  contributionController.contributionList);
                        },
                        child: const Text('Submit'),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
