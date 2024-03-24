import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_art/src/models/app_models.dart';
import 'package:my_art/src/repositories/authentication_repository/authentication_repository.dart';
import 'package:my_art/src/repositories/user_repository/user_repository.dart';

class AddPatientController extends GetxController {
  static AddPatientController get instance => Get.find();

  // Get data from TextField Controllers
  final oiartnumber = TextEditingController();
  final fullname = TextEditingController();
  final phoneNo = TextEditingController();
  final email = TextEditingController();
  final age = TextEditingController();
  final gender = TextEditingController();
  final address = TextEditingController();
  final country = TextEditingController();
  final province = TextEditingController();
  final city = TextEditingController();
  final allergies = TextEditingController();
  final note = TextEditingController();
  final userRepo = Get.put(UserRepository());

  Future<void> AddPatient(UserModel user) async {
    await userRepo.createUser(user);
    //signUpUser(user.email, user.password);
  }

  Future<void> signUpUser(
      {required String email, required String password}) async {
    String? error = await AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password);

    if (error == null) {
      Get.showSnackbar(const GetSnackBar(
        title: 'Success',
        message: 'Patient Saved Successfully',
        duration: Duration(seconds: 3),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color(0xff303e9f),
        margin: EdgeInsets.all(8),
        borderRadius: 8,
        icon: Icon(Icons.check_circle_outline),
      ));
    } else {
      Get.showSnackbar(GetSnackBar(
        message: error.toString(),
        duration: const Duration(seconds: 2),
      ));
    }
  }
}
