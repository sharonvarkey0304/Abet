import 'package:get/get.dart';
import 'package:loginpage/controler/firebase_auth.dart';
import 'package:loginpage/model/user_model.dart';

enum UserProfileStatus { initial, loading, loaded, error }

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();
  Usermodel? userData;
  UserProfileStatus userProfileStatus = UserProfileStatus.initial;

//
  final _authrep = Get.put(Authentication());
  void getUserData() async {
    setUserProfileStatus(status: UserProfileStatus.loading);
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
    await _authrep.updateUserRecord(user);
  }
}
