import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_art/src/repositories/authentication_repository/authentication_repository.dart';

class SignInController extends GetxController {
  static SignInController get instance => Get.find();

  /// TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();

  Future<void> logInUser(String email, String password) async {
    String? error = await AuthenticationRepository.instance
        .signInWithEmailAndPassword(email, password);
        if (error == null) {
         Get.showSnackbar( const GetSnackBar(
                      title: 'Login Successful',
                      message: 'Welcome back',
                      duration:  Duration(seconds: 3),
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.green,
                      margin: EdgeInsets.all(8),
                      borderRadius: 8,
                      icon: Icon(Icons.check_circle_outline),
         ));
    } else {
    Get.showSnackbar(GetSnackBar(
      message: error.toString(),
      duration: const Duration(seconds: 2)
      ));
  }
}
}