import 'package:get/get.dart';
import 'package:loginpage/controler/firebase_auth.dart';
import 'package:loginpage/model/user_model.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();
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
    await _authrep.updateUserRecord(user);
  }
}
