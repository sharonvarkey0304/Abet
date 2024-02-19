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
        child: SingleChildScrollView(
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
                    width: 20,
                  ),
                  Center(
                    child: Stack(
                      children: [
                        //image container
                        SizedBox(
                          height: 190,
                          width: 170,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.asset(
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
                            onPressed: () {},
                            icon: const Icon(
                              FontAwesomeIcons.cameraRetro,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      contributionController.contributionList.add(
                        ContributionDatum(
                          title: contributionController.titleController.text,
                          subject:
                              contributionController.subjectController.text,
                          semester:
                              contributionController.semesterController.text,
                          details:
                              contributionController.detailsController.text,
                          id: Uuid().v4(),
                          imageBase64: "11111111111",
                        ),
                      );

                      contributionController.setContributiontoFirestore(
                          contributionList:
                              contributionController.contributionList);
                    },
                    child: const Text('Submit'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
