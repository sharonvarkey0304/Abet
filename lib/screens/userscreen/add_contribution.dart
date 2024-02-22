import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:loginpage/controler/contribution_controller.dart';
import 'package:loginpage/widgets/snackbar.dart';

class AddMaterial extends StatefulWidget {
  const AddMaterial({Key? key}) : super(key: key);

  @override
  State<AddMaterial> createState() => _AddMaterialState();
}

class _AddMaterialState extends State<AddMaterial> {
  final contributionController = Get.put(ContributionController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final String _requiredFieldtext = "This field is required";

  @override
  void initState() {
    contributionController.clearAllController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<ContributionController>(builder: (controller) {
          return SingleChildScrollView(
            child: Form(
              key: _formKey,
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return _requiredFieldtext;
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return _requiredFieldtext;
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return _requiredFieldtext;
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return _requiredFieldtext;
                            }
                            return null;
                          },
                          keyboardType: TextInputType.multiline,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                              child: contributionController.isImageLoading
                                  ? Center(
                                      child: CommonWidget.loadingIndicator(
                                          color: Colors.amber.withOpacity(0.5)),
                                    )
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: contributionController.image !=
                                              null
                                          ? Image.network(
                                              contributionController.image ??
                                                  "",
                                              fit: BoxFit.cover,
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                return Image.asset(
                                                  'assets/images/nophoto.png',
                                                  fit: BoxFit.cover,
                                                );
                                              },
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
                            if (_formKey.currentState!.validate()) {
                              contributionController.onSubmitButton();
                            }
                          },
                          child: contributionController.isSubmitLoading
                              ? CommonWidget.loadingIndicator()
                              : const Text('Submit'),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
