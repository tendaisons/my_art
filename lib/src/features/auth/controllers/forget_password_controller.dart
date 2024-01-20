import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_art/src/repositories/authentication_repository/authentication_repository.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  TextEditingController emailText = TextEditingController();

  // Reset Password
  Future<void> resetPassword(String emailText) async {
    try {
      await Get.find<AuthenticationRepository>()
          .resetPassword(emailText);
      Get.snackbar('Success', 'Password reset link sent to your email.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.1),
          colorText: Colors.green);
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.1),
          colorText: Colors.red);
    }
  }
}