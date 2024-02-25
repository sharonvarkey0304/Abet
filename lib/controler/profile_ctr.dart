import 'package:get/get.dart';
import 'package:loginpage/controler/firebase_auth.dart';
import 'package:loginpage/model/user_model.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();
  bool isLoadingUpdateProfile = false;
//

//
  final _authrep = Get.put(Authentication());
  getUserData() {
    final email = _authrep.firebaseUser.value?.email;
    if (email != null) {
      return _authrep.getUserDetails(email);
    } else {
      Get.snackbar("Error", "login to continue");
    }
  }

  updateRecord(Usermodel user) async {
    isLoadingUpdateProfile = true;
    update();
    await Future.delayed(Duration(seconds: 3));
    await _authrep.updateUserRecord(user);
    isLoadingUpdateProfile = false;
    update();
  }

  String? commonValidator(String? value) {
    if (value == null) return null;
    if (value.isEmpty) return 'This Field is required';
    return null;
  }
}
