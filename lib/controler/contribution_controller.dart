import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loginpage/controler/store_controller.dart';
import 'package:loginpage/model/contribution_model.dart';
import 'package:loginpage/widgets/snackbar.dart';
import 'package:uuid/uuid.dart';

class ContributionController extends GetxController {
  static FirebaseAuth get _auth => FirebaseAuth.instance;
  static CollectionReference<Map<String, dynamic>> get _contribution =>
      FirebaseFirestore.instance.collection("contribution");

  List<ContributionDatum> contributionList = [];
  List<Semester> subjectList = [];
  List<Subject> itemsInsideSubjectList = [];

  TextEditingController titleController = TextEditingController();
  TextEditingController semesterController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  String? image;

  bool isSubmitLoading = false;
  bool isImageLoading = false;

  Future<void> setContributiontoFirestore(
      {required List<ContributionDatum> contributionList}) async {
    final userId = _auth.currentUser?.uid;
    setSubmitLoad(true);
    try {
      List<Map<String, dynamic>> serializedList =
          contributionList.map((obj) => obj.toJson()).toList();

      await _contribution.doc(userId).set(
        {'contribution_data': serializedList},
        SetOptions(merge: true),
      );
      await getContributionList();
      setSubmitLoad(false);
      clearAllController();
      CommonWidget.snackBar(
        isSuccsess: true,
        title: "Succesfull",
        subtitle: "Contribution added succesfully",
      );
    } catch (e) {
      setSubmitLoad(false);
      CommonWidget.snackBar(
        isSuccsess: false,
        title: "Something Went wrong",
        subtitle: e.toString(),
      );
    }
  }

  setSubmitLoad(bool value) {
    isSubmitLoading = value;
    update();
  }

  setImageLoad(bool value) {
    isImageLoading = value;
    update();
  }

  clearAllController() {
    titleController.clear();
    semesterController.clear();
    subjectController.clear();
    detailsController.clear();
    image = "";
    update();
  }

  Future<void> setSemesteContributiontoFirestore(
      {required List<Semester> subjectList}) async {
    final userId = _auth.currentUser?.uid;
    // final newList = List.from(subjectList);
    // newList.add(contributionData);
    try {
      List<Map<String, dynamic>> serializedList =
          subjectList.map((obj) => obj.toJson()).toList();

      await _contribution.doc(userId).update(
        {'semester': serializedList},
        // SetOptions(merge: true),
      );
      getContributionList();
    } catch (e) {
      CommonWidget.snackBar(
        isSuccsess: false,
        title: "Something Went wrong",
        subtitle: e.toString(),
      );
    }
  }

  Future<void> setSubjectContributiontoFirestore(
      {required List<Subject> itemsInsideSubjectList}) async {
    final userId = _auth.currentUser?.uid;
    try {
      List<Map<String, dynamic>> serializedList =
          itemsInsideSubjectList.map((obj) => obj.toJson()).toList();

      await _contribution.doc(userId).update(
        {'subject': serializedList},
        // SetOptions(merge: true),
      );
      getContributionList();
    } catch (e) {
      CommonWidget.snackBar(
        isSuccsess: false,
        title: "Something Went wrong",
        subtitle: e.toString(),
      );
    }
  }

  Future<void> getContributionList() async {
    final userId = _auth.currentUser?.uid;
    ContributionDataModel? data;

    try {
      if (userId != null) {
        DocumentSnapshot querySnapshot = await _contribution.doc(userId).get();
        if (querySnapshot.data() != null) {
          data = ContributionDataModel.fromJson(
              querySnapshot.data() as Map<String, dynamic>);
        }

        contributionList = data?.contributionData ?? [];
        log("rrrrrrrrr  ${querySnapshot.data()}");
      }
    } catch (e) {
      log("erro $e");
      CommonWidget.snackBar(
        isSuccsess: false,
        title: "Something Went wrong",
        subtitle: e.toString(),
      );
    }
  }

  void setSubjectList(int semindex) {
    subjectList.clear();
    for (var element in contributionList) {
      if (int.tryParse(element.semesterName ?? "-1") == semindex) {
        subjectList.addAll(element.semester ?? []);
      }
    }
  }

  void setItemsInsideSubjectList(String subject) {
    itemsInsideSubjectList.clear();
    for (var element in subjectList) {
      if (element.subjectName == subject) {
        itemsInsideSubjectList.addAll(element.subject ?? []);
      }
    }
  }

  Future<void> pickImage() async {
    final StoreController storeController = Get.put(StoreController());
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setImageLoad(true);
        image = await storeController.cloudinaryImage(File(pickedFile.path));
      }
      setImageLoad(false);

      update();
    } catch (e) {
      setImageLoad(false);
      print('Error while picking an image: $e');
    }
  }

  onSubmitButton() async {
    if (contributionList
        .any((e) => e.semesterName == semesterController.text)) {
      final indexSem = contributionList.indexWhere(
          (element) => element.semesterName == semesterController.text);
      if (contributionList[indexSem]
          .semester!
          .any((element) => element.subjectName == subjectController.text)) {
        final indexSub = contributionList[indexSem].semester!.indexWhere(
            (element) => element.subjectName == subjectController.text);

        contributionList[indexSem].semester?[indexSub].subject?.add(Subject(
              id: Uuid().v4(),
              details: detailsController.text,
              imageBase64: image,
              title: titleController.text,
            ));
      } else {
        contributionList[indexSem].semester?.add(
              Semester(
                subjectName: subjectController.text,
                subject: [
                  Subject(
                    id: Uuid().v4(),
                    details: detailsController.text,
                    imageBase64: image,
                    title: titleController.text,
                  )
                ],
              ),
            );
      }
    } else {
      contributionList.add(
        ContributionDatum(
          id: Uuid().v1(),
          semesterName: semesterController.text,
          semester: [
            Semester(
              subjectName: subjectController.text,
              subject: [
                Subject(
                  id: Uuid().v4(),
                  details: detailsController.text,
                  imageBase64: image,
                  title: titleController.text,
                )
              ],
            )
          ],
        ),
      );
    }

    await setContributiontoFirestore(contributionList: contributionList);
  }
}
