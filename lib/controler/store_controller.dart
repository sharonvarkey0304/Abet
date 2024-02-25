import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloudinary/cloudinary.dart';
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
  TextEditingController productSearchController = TextEditingController();
  final auth = FirebaseAuth.instance;
  final fbReference = FirebaseFirestore.instance.collection('Products');
  List<ProductDataList> productList = <ProductDataList>[];
  List<ProductDataList> filteredProductList = <ProductDataList>[];
  List<String> images = <String>[];
  AddProductStatus addProductStatus = AddProductStatus.initial;
  bool imageLoading = false;

  final cloudinary = Cloudinary.signedConfig(
    apiKey: "379449483728479",
    apiSecret: "P84yD201T01-JblVWczdP-1GB_Q",
    cloudName: "dkd1urq1v",
  );

  Future<void> getProductsFromFB() async {
    try {
      String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
      ProductModel? data;
      var fbRef = FirebaseFirestore.instance.collection('Products').doc(userId);
      DocumentSnapshot snapshot = await fbRef.get();
      if (snapshot.data() != null) {
        data = ProductModel.fromJson(snapshot.data() as Map<String, dynamic>);
      }

      productList = data?.productDataList ?? [];
      filteredProductList = data?.productDataList ?? [];

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
      setImageLoading(true);
      for (var e in pickedFile) {
        var tempImg = await cloudinaryImage(File(e.path));
        images.add(tempImg ?? '');
      }
      setImageLoading(false);
    } catch (e) {
      setImageLoading(false);
      print('Error while picking an image: $e');
    }
  }

  setImageLoading(value) {
    imageLoading = value;
    update();
  }

  Future<String?> cloudinaryImage(File file) async {
    final response = await cloudinary.upload(
      file: file.path,
      fileBytes: file.readAsBytesSync(),
      resourceType: CloudinaryResourceType.image,
    );
    if (response.isSuccessful) {
      return response.secureUrl;
    }
    return null;
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

//
  Future<void> deleteProduct({required ProductDataList item}) async {
    try {
      var uid = auth.currentUser?.uid;
      DocumentReference productRef =
          FirebaseFirestore.instance.collection('Products').doc(uid);

      productList.remove(item);
      filteredProductList.remove(item);

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

  void searchProduct(String query, {bool isCallingIninit = false}) {
    if (query.isEmpty) {
      filteredProductList = productList;
    } else {
      filteredProductList = productList.where((e) {
        var itemName = e.name.toLowerCase();
        var itemEmail = e.email.toLowerCase();
        var itemContact = e.contactNumber.toLowerCase();
        query = query.toLowerCase();

        return itemName.contains(query) ||
            itemEmail.contains(query) ||
            itemContact.contains(query);
      }).toList();
    }
    if (isCallingIninit == false) {
      update();
    }
  }

  @override
  void onInit() {
    searchProduct('', isCallingIninit: true);
    productSearchController.clear();
    getProductsFromFB();
    super.onInit();
  }
}
