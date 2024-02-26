import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loginpage/controler/profile_ctr.dart';
import 'package:loginpage/controler/store_controller.dart';
import 'package:loginpage/model/contribution_model.dart';
import 'package:loginpage/widgets/snackbar.dart';
import 'package:uuid/uuid.dart';

enum ContributionStatus { initial, loading, loaded, error }

class ContributionController extends GetxController {
  static FirebaseAuth get _auth => FirebaseAuth.instance;
  static CollectionReference<Map<String, dynamic>> get _contribution =>
      FirebaseFirestore.instance.collection("contribution");

  final userProfilecntrl = Get.put(ProfileController());
  final fbReference = FirebaseFirestore.instance.collection('contribution');

  List<ContributionDatum> contributionList = [];
  // List<ContributionDatum> yourUploadsList = [];
  List<Subject> yourUploadSubjectList = [];
  List<Semester> subjectList = [];
  List<Subject> itemsInsideSubjectList = [];

  TextEditingController titleController = TextEditingController();
  TextEditingController semesterController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController contributionSearchController = TextEditingController();
  String? image;

  Map<String, Map<String, List<String>>> semesterMap = {
    'Semester 1': {
      "BBA": [
        "Management theory and practices",
        "Managerial economics",
      ],
      "BCA": [
        "Computer fundamentals and html",
        "Mathematical foundation",
        "Discrete mathematics",
      ],
      "BSC": ["Angiosperm anatomy reproductive botany &palynology"],
    },
    'Semester 2': {
      "BBA": [
        "Financial accounting",
        "Marketing management",
      ],
      "BCA": [
        "Problem solving using c",
        "Financial and management accounting",
        "Operation research",
      ],
      "BSC": [
        "Microbiology,mycrology, lichenology and plant pathology",
      ],
    },
    'Semester 3': {
      "BBA": [
        "Corporate accounting",
        "Financial management",
      ],
      "BCA": [
        "Data structure using c",
        "Python programming",
        "Computer oriented numerical and statistical methods",
        "Data communication and optical fibers",
        "Theory of computation",
      ],
      "BSC": [
        "Phycology, bryology and pteridology",
      ],
    },
    'Semester 4': {
      "BBA": [
        "Cost and management accounting",
        "Corporate regulations",
      ],
      "BCA": [
        "Microprocessors architecture and programming",
        "Sensors and transducers",
        "Database management system and rdbms",
        "E-commerce",
        "Computer graphics",
      ],
      "BSC": ["Methodology&perspective in plant science"],
    },
    'Semester 5': {
      "BBA": [
        "Human resources management",
        "Business research methods",
        "Operations management",
      ],
      "BCA": [
        "Computer organisation and architechture",
        "Web programming using php",
        "Java programming",
        "Principle of software engineering",
      ],
      "BSC": [
        "Gymnosperms,palaeobotany phytogeography and evolution",
        "Angiosperms morphology and plant systematics",
        "Tissue culture horticulture Economic botany and ethnobotany",
        "Cell biology and biochemistry",
      ],
    },
    'Semester 6': {
      "BBA": [
        "Organizational behaviour",
        "Management science",
        "Project management",
      ],
      "BCA": [
        "Android programming",
        "Computer networks",
        "Operating system",
        "Software testing and quality assurance",
      ],
      "BSC": [
        "Genetics and plant breeding",
        "Biotechnology moleculer Biology and bioinformatics",
        "Plant physiology and metabolism",
        "Environmental science",
      ],
    }
  };

  bool isSubmitLoading = false;
  bool isImageLoading = false;
  ContributionStatus contributionStatus = ContributionStatus.initial;

  Future<void> setContributiontoFirestore(
      {required List<ContributionDatum> contributionList,
      bool isSnackbarNeed = true}) async {
    // final userId = _auth.currentUser?.uid;

    final userCourseId = userProfilecntrl.userData?.course;
    setSubmitLoad(true);
    try {
      List<Map<String, dynamic>> serializedList =
          contributionList.map((obj) => obj.toJson()).toList();

      await _contribution.doc(userCourseId).set(
        {'contribution_data': serializedList},
        SetOptions(merge: true),
      );
      await getContributionList();
      setSubmitLoad(false);
      clearAllController();
      if (isSnackbarNeed) {
        CommonWidget.snackBar(
          isSuccsess: true,
          title: "Succesfull",
          subtitle: "Contribution added succesfully",
        );
      }
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

  setContributionStatus({required ContributionStatus status}) {
    contributionStatus = status;
    update();
  }

  Future<void> getContributionList() async {
    // final userId = _auth.currentUser?.uid;
    final userCourseId = userProfilecntrl.userData?.course;
    ContributionDataModel? data;

    try {
      setContributionStatus(status: ContributionStatus.loading);
      if (userCourseId != null) {
        DocumentSnapshot querySnapshot =
            await _contribution.doc(userCourseId).get();
        if (querySnapshot.data() != null) {
          data = ContributionDataModel.fromJson(
              querySnapshot.data() as Map<String, dynamic>);
        }

        contributionList = data?.contributionData ?? [];
        setYourUploadsList(contributionList: contributionList);
        log("rrrrrrrrr  ${querySnapshot.data()}");
        setContributionStatus(status: ContributionStatus.loaded);
      }
    } catch (e) {
      log("erro $e");
      setContributionStatus(status: ContributionStatus.error);
      CommonWidget.snackBar(
        isSuccsess: false,
        title: "Something Went wrong",
        subtitle: e.toString(),
      );
    }
  }

  void setYourUploadsList({required List<ContributionDatum> contributionList}) {
    yourUploadSubjectList.clear();
    // yourUploadsList = contributionList.where((contribution) {
    //   return contribution.semester!.any((semester) {
    //     return semester.subject!.any((subject) {
    //       if (subject.useruid == _auth.currentUser?.uid) {
    //         yourUploadSubjectList.add(subject);
    //       }
    //       return subject.useruid == _auth.currentUser?.uid;
    //     });
    //   });
    // }).toList();

    // List<Subject> extractedSubjects = [];
    yourUploadSubjectList = contributionList
        .expand((contribution) => contribution.semester!)
        .expand((semester) => semester.subject!)
        .where((subject) => subject.useruid == _auth.currentUser!.uid)
        .toList();

    update();
  }

  void setSubjectList(int semindex) {
    subjectList.clear();
    for (var element in contributionList) {
      if (element.semesterName == "Semester $semindex") {
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

  Future<void> pickPdf() async {
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
  // Future<void> pickPdf() async {
  //   final StoreController storeController = Get.put(StoreController());
  //   final picker = ImagePicker();
  //   try {
  //     // FilePickerResult? result = await FilePicker.platform.pickFiles(
  //     //   type: FileType.custom,
  //     //   allowedExtensions: ['pdf'],
  //     //);
  //     final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  //     if (pickImage != null) {
  //       setImageLoad(true);

  //       image = await storeController.cloudinaryImage(File(pickedFile!.path));
  //     }
  //     setImageLoad(false);

  //     update();
  //   } catch (e) {
  //     setImageLoad(false);
  //     print('Error while picking an image: $e');
  //   }
  // }

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

        contributionList[indexSem].semester?[indexSub].subject?.add(
              Subject(
                id: Uuid().v4(),
                useruid: _auth.currentUser?.uid,
                details: detailsController.text,
                imageBase64: image,
                title: titleController.text,
              ),
            );
      } else {
        contributionList[indexSem].semester?.add(
              Semester(
                subjectName: subjectController.text,
                subject: [
                  Subject(
                    id: Uuid().v4(),
                    useruid: _auth.currentUser?.uid,
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
                  useruid: _auth.currentUser?.uid,
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

  Future<void> deleteYourUploads({required String itemId}) async {
    // Check if any element in contributionList matches the itemId

    List<ContributionDatum> newList = List.from(contributionList);
    if (newList.any((element) => element.semester!.any((semester) =>
        semester.subject!.any((subject) => subject.id == itemId)))) {
      // If itemId is found, delete it
      for (var element in contributionList) {
        for (var semester in element.semester!) {
          semester.subject!.removeWhere((subject) => subject.id == itemId);
        }
      }
    }
    print("11111111111");

    try {
      await setContributiontoFirestore(
          contributionList: newList, isSnackbarNeed: false);
      CommonWidget.snackBar(
          isSuccsess: true,
          title: "Succesfull",
          subtitle: "Item deleted succesfully");
    } catch (e) {
      CommonWidget.snackBar(
        isSuccsess: false,
        title: "Error",
        subtitle: "Could not delete",
      );
    }
    print("33333333333");
  }

  void searchContribution(String query, {bool isCallingIninit = false}) {
    if (query.isEmpty) {
      itemsInsideSubjectList = yourUploadSubjectList;
    } else {
      itemsInsideSubjectList = yourUploadSubjectList.where((e) {
        var itemTitle = e.title; //.toLowerCase();
        var subName = e.details; //.toLowerCase();
        // var semName = e.; //.toLowerCase();
        query = query.toLowerCase();

        return itemTitle!.contains(query) || subName!.contains(query);
        // semName.contains(query);
      }).toList();
    }
    if (isCallingIninit == false) {
      update();
    }
  }

  // @override
  // void onInit() {
  //   searchContribution('', isCallingIninit: true);
  //   contributionSearchController.clear();
  //   getProductsFromFB();
  //   super.onInit();
  // }
}
