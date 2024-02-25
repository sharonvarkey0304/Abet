import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginpage/model/contribution_model.dart';
import 'package:loginpage/widgets/snackbar.dart';
import '../../../controler/contribution_controller.dart';

class Uploads extends StatefulWidget {
  const Uploads({super.key});

  @override
  State<Uploads> createState() => _UploadsState();
}

class _UploadsState extends State<Uploads> {
  final contributionController = Get.put(ContributionController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
      ),
      body: GetBuilder<ContributionController>(
        builder: (controller) {
          log("your upload ${controller.yourUploadSubjectList.length}");
          if (controller.contributionStatus == ContributionStatus.loading) {
            return Center(
              child: CommonWidget.loadingIndicator(color: Colors.amber),
            );
          }
          return ListView(
            children: [
              SizedBox(
                height: 330,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assets/images/upload.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 9),
                  child: Text(
                    "Recent Uploads",
                    style: GoogleFonts.poppins(fontSize: 30),
                  ),
                ),
              ),
              SizedBox(height: 30),
              controller.yourUploadSubjectList.isEmpty
                  ? Center(
                      child: Text("NO UPLOADS"),
                    )
                  : ListView.separated(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: controller.yourUploadSubjectList.length,
                      itemBuilder: (context, index) {
                        final subject = controller.yourUploadSubjectList[index];

                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: _buildUploadItem(
                              fileName: subject.title ?? "NO NAME",
                              directory: '',
                              item: subject),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 15,
                        );
                      },
                    ),
              SizedBox(
                height: 20,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildUploadItem(
      {required String fileName,
      required String directory,
      required Subject item}) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            Icons.insert_drive_file,
            color: Colors.red,
            size: 32, // Adjust the size as needed
          ),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                fileName,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                directory,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Spacer(), // Adds space to push the next icon to the end
          GestureDetector(
            onTap: () {
              showLogoutDialog(context, item);
            },
            child: Icon(
              Icons.delete,
              color: Colors.red, // Set the color as needed
              size: 24, // Adjust the size as needed
            ),
          ),
        ],
      ),
    );
  }

  void showLogoutDialog(BuildContext context, Subject item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('DELETE'),
          content: Text('Do you want to DELETE?'),
          actions: [
            TextButton(
              onPressed: () async {
                await contributionController.deleteYourUploads(
                    itemId: item.id!);
                Navigator.of(context).pop();
              },
              child: Text('Yes'),
            ),
            TextButton(
              onPressed: () {},
              child: Text('No'),
            ),
          ],
        );
      },
    );
  }
}
