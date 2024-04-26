import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_art/src/models/app_models.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  var user = UserModel(email: '', fullname: '', phoneNo: '', location: '', dateofbirth: '').obs;

  @override
  void onInit() {
    super.onInit();
    getUserDetails("email");
  }

  createUser(UserModel user) async {
    await _db
        .collection("Users")
        // Use Firebase user uid as docID
        .doc(user.uid)
        .set(user.toJson())
        .whenComplete(
          () => Get.snackbar('Success', 'Your account has been created.',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor:
                  Color.fromARGB(255, 154, 207, 225).withOpacity(0.1),
              colorText: Colors.green),
        )
        // ignore: body_might_complete_normally_catch_error
        .catchError((error, stackTrace) async {
      Get.snackbar('Error', 'Something went wrong. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.1),
          colorText: Colors.red);
    });
  }

  Future<UserModel> getUserDetails(String email) async {
    final snapshot =
        await _db.collection("Users").where("Email", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    user.value = userData;
    return userData;
  }

  // Update user details
  updateRecord(UserModel user) async {
    await _db
        .collection("Users")
        .doc(user.uid)
        .update(user.toJson())
        .whenComplete(
          () => Get.snackbar('Success', 'Your details have been updated.',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.1),
              colorText: Colors.green),
        )
        .catchError((error, stackTrace) async {
      Get.snackbar('Error', 'Something went wrong. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.1),
          colorText: Colors.red);
    });
  }

  // Delete user account
  deleteRecord(String id) async {
    await _db
        .collection("Users")
        .doc(id)
        .delete()
        .whenComplete(
          () => Get.snackbar('Success', 'Your account has been deleted.',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.1),
              colorText: Colors.lightBlueAccent),
        )
        .catchError((error, stackTrace) async {
      Get.snackbar('Error', 'Something went wrong. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.1),
          colorText: Colors.red);
    });
  }
}
