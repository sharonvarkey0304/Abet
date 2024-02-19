import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginpage/model/contribution_model.dart';
import 'package:loginpage/widgets/snackbar.dart';

class ContributionController extends GetxController {
  static FirebaseAuth get _auth => FirebaseAuth.instance;
  static CollectionReference<Map<String, dynamic>> get _contribution =>
      FirebaseFirestore.instance.collection("contribution");

  List<ContributionDatum> contributionList = [];

  TextEditingController titleController = TextEditingController();
  TextEditingController semesterController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController detailsController = TextEditingController();

  Future<void> setContributiontoFirestore(
      {required List<ContributionDatum> contributionList}) async {
    final userId = _auth.currentUser?.uid;
    // final newList = List.from(contributionList);
    // newList.add(contributionData);
    try {
      List<Map<String, dynamic>> serializedList =
          contributionList.map((obj) => obj.toJson()).toList();

      await _contribution.doc(userId).set(
        {'contribution_data': serializedList},
        SetOptions(merge: true),
      );
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

    try {
      if (userId != null) {
        DocumentSnapshot querySnapshot = await _contribution.doc(userId).get();
        final data = ContributionDataModel.fromJson(
            querySnapshot.data() as Map<String, dynamic>);

        contributionList = data.contributionData ?? [];
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
}
