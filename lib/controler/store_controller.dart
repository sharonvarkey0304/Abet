import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loginpage/model/product_model.dart';
import 'package:loginpage/widgets/snackbar.dart';
import 'package:uuid/uuid.dart';

enum AddProductStatus {
  initial,
  loading,
  error,
  loaded,
}

class StoreController extends GetxController {
  TextEditingController productNameController = TextEditingController();
  TextEditingController productDetailsController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productContactNumController = TextEditingController();
  TextEditingController productEmailController = TextEditingController();
  final auth = FirebaseAuth.instance;
  final fbReference = FirebaseFirestore.instance.collection('Products');
  List<ProductDataList> productList = <ProductDataList>[];
  List<String> images = <String>[];
  AddProductStatus addProductStatus = AddProductStatus.initial;

  Future<void> getProductsFromFB() async {
    try {
      String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
      var fbRef = FirebaseFirestore.instance.collection('Products').doc(userId);
      DocumentSnapshot snapshot = await fbRef.get();
      final data =
          ProductModel.fromJson(snapshot.data() as Map<String, dynamic>);
      productList = data.productDataList ?? [];
      update();
    } catch (e) {
      log('error in getting products list: $e');
    }
  }

  Future<void> addProduct(List<ProductDataList> product) async {
    try {
      List<Map<String, dynamic>> serializedList =
          product.map((x) => x.toJson()).toList();
      var userId = auth.currentUser?.uid;

      await fbReference.doc(userId).set(
        {
          'product_list': serializedList,
        },
        SetOptions(merge: true),
      );
      addProductStatus = AddProductStatus.loaded;
      Get.defaultDialog(
        barrierDismissible: false,
        title: "Success",
        middleText: "Product details added successfully",
        backgroundColor: Colors.white,
        titleStyle: TextStyle(color: Colors.black),
        middleTextStyle: TextStyle(color: Colors.black),
        contentPadding: EdgeInsets.all(30),
      );

      Future.delayed(
        Duration(seconds: 2),
        () {
          Get.back();
          Get.back();

          clearProductForm();
        },
      );
      update();
      await getProductsFromFB();
    } catch (e) {
      addProductStatus = AddProductStatus.error;
      debugPrint('errror on adding product: $e');
    }
  }

  Future<void> addProductBtnOntap(GlobalKey<FormState> formKey) async {
    try {
      bool isFormKeyValidated = formKey.currentState?.validate() ?? true;
      bool isNotLoading = addProductStatus != AddProductStatus.loading;
      if (isFormKeyValidated && images.isNotEmpty && isNotLoading) {
        addProductStatus = AddProductStatus.loading;
        productList.clear();
        await getProductsFromFB();

        productList.add(
          ProductDataList(
            contactNumber: productContactNumController.text.trim(),
            details: productDetailsController.text.trim(),
            email: productEmailController.text.trim(),
            name: productNameController.text.trim(),
            price: productPriceController.text.trim(),
            id: Uuid().v4(),
            image: images,
            isFavourite: false,
          ),
        );

        //this delay is used only for showing the loading indicator on the add product button.
        await Future.delayed(Duration(seconds: 2));
        await addProduct(productList);
        update();
      } else if (images.isEmpty && isFormKeyValidated) {
        CommonWidget.snackBar(
          isSuccsess: false,
          title: 'Missing field',
          subtitle: 'Please select an image to continue',
        );
      }
    } catch (e) {
      log('error1: $e');
    }
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    images.clear();
    try {
      final pickedFile = await picker.pickMultiImage();
      for (var e in pickedFile) {
        var tempImg = File(e.path).readAsBytesSync();

        images.add(base64Encode(tempImg));
      }

      update();
    } catch (e) {
      print('Error while picking an image: $e');
    }
  }

  List<String> convertUint8ListToTempFiles(List<Uint8List> images) {
    List<String> tempFilePaths = [];

    for (var image in images) {
      File tempFile = File('${DateTime.now().millisecondsSinceEpoch}.png');

      tempFile.writeAsBytesSync(image);

      tempFilePaths.add(tempFile.path);
    }

    return tempFilePaths;
  }

  Future<void> likeProduct({required ProductDataList item}) async {
    try {
      var uid = auth.currentUser?.uid;
      DocumentReference productRef =
          FirebaseFirestore.instance.collection('Products').doc(uid);

      item.isFavourite = !item.isFavourite;

      productRef.update(
        {
          'product_list': productList.map((x) => x.toJson()).toList(),
        },
      );
      update();
    } catch (e) {
      log('Error in liking image: $e');
    }
  }

  Future<void> deleteProduct({required ProductDataList item}) async {
    try {
      var uid = auth.currentUser?.uid;
      DocumentReference productRef =
          FirebaseFirestore.instance.collection('Products').doc(uid);

      productList.remove(item);

      productRef.update(
        {
          'product_list': productList.map((x) => x.toJson()).toList(),
        },
      );
      update();
    } catch (e) {
      log('Error in deleting image: $e');
    }
  }

  void clearProductForm() {
    productNameController.clear();
    productDetailsController.clear();
    productPriceController.clear();
    productContactNumController.clear();
    productEmailController.clear();
    images.clear();
    update();
  }

  String? commonValidator(String? value) {
    if (value == null) return null;
    if (value.isEmpty) return 'This Field is required';
    return null;
  }

  @override
  void onInit() {
    getProductsFromFB();
    super.onInit();
  }
}
