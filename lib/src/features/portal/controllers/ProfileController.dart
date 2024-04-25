import 'package:get/get.dart';

import '../../../models/app_models.dart';
import '../../../repositories/authentication_repository/authentication_repository.dart';
import '../../../repositories/user_repository/user_repository.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();


  Rx<UserModel?> userData = Rx<UserModel?>(null);

  // Initialize get user data
  @override
  void onInit() {
    super.onInit();
    getUserData();
    getUserInfo();
  }

// Repositories
  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

// Get user Email and Password to UserRepository to fetch record
  getUserData() {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar("Error", "Signin to continue");
    }
  }

  getUserInfo() async {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      try {
        UserModel user = await _userRepo.getUserDetails(email);
        userData.value = user;
      } catch (e) {
        Get.snackbar("Error", "Failed to fetch user data");
      }
    } else {
      Get.snackbar("Error", "Sign in to continue");
    }
  }


  
  updateRecord(UserModel user) async {
    await _userRepo.updateRecord(user);

  }

// Delete user record
  deleteRecord(String id) async {
    await _userRepo.deleteRecord(id);
  }
  
}