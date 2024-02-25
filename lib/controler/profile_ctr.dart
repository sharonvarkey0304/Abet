import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loginpage/controler/firebase_auth.dart';
import 'package:loginpage/model/user_model.dart';
import 'package:loginpage/widgets/snackbar.dart';

import 'store_controller.dart';

enum UserProfileStatus { initial, loading, loaded, error }

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();
//
  Usermodel? userData;
  String? selectedImage;
  bool isSubmitLoading = false;
  bool isImageLoading = false;
  UserProfileStatus userProfileStatus = UserProfileStatus.initial;

//
  final _authrep = Get.put(Authentication());
  Future<void> getUserData({bool isLoading = true}) async {
    if (isLoading) {
      setUserProfileStatus(status: UserProfileStatus.loading);
    }
    final email = _authrep.firebaseUser.value?.email;
    if (email != null) {
      try {
        userData = await _authrep.getUserDetails(email);
        setUserProfileStatus(status: UserProfileStatus.loaded);
      } catch (e) {
        Get.snackbar("Error", "login to continue");
        setUserProfileStatus(status: UserProfileStatus.error);
      }
    } else {
      Get.snackbar("Error", "login to continue");
      setUserProfileStatus(status: UserProfileStatus.error);
    }
  }

  setUserProfileStatus({required UserProfileStatus status}) {
    userProfileStatus = status;
    update();
  }

  updateRecord(Usermodel user) async {
    try {
      setSubmitLoad(true);
      await _authrep.updateUserRecord(user);
      await getUserData(isLoading: false);
      // Get.back();
      // selectedImage = null;
      setSubmitLoad(false);
    } catch (e) {
      setSubmitLoad(false);
      CommonWidget.snackBar(
          isSuccsess: false,
          title: "Error occured",
          subtitle: "Could not update profile");
    }
  }

  Future<void> pickImage() async {
    final StoreController storeController = Get.put(StoreController());
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setImageLoad(true);
        selectedImage =
            await storeController.cloudinaryImage(File(pickedFile.path));
      }
      setImageLoad(false);

      update();
    } catch (e) {
      setImageLoad(false);
      print('Error while picking an image: $e');
    }
  }

  String? commonValidator(String? value) {
    if (value == null) return null;
    if (value.isEmpty) return 'This Field is required';
    return null;
  }

  setImageLoad(bool value) {
    isImageLoading = value;
    update();
  }

  setSubmitLoad(bool value) {
    isSubmitLoading = value;
    update();
  }
}
