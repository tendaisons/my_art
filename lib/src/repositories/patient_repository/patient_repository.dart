import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_art/src/models/patient_models.dart';

class PatientRepository extends GetxController {
static PatientRepository get instance => Get.find();

final _db = FirebaseFirestore.instance;

createPatient(Patient patient) {
  _db.collection("Patients").add(patient.toJson()).whenComplete(
        () => Get.snackbar('Success', 'Patient Saved Successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.1),
        colorText: Colors.green),
  ).catchError((error, stackTrace) async {
    Get.snackbar(
        'Error',
        'Something went wrong. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.1),
        colorText: Colors.red);
  });

}

getAllPatients() async {
  final snapshot = await _db.collection("Patients").get();
  return snapshot.docs.map((e) => Patient.fromSnapshot(e)).toList();
}

// Update user details
updatePatientRecord(Patient patient) async {
  await _db
      .collection("Patients")
      .doc(patient.id)
      .update(patient.toJson())
      .whenComplete(
        () =>
        Get.snackbar('Success', 'Your details have been updated.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.withOpacity(0.1),
            colorText: Colors.green),
  )
      .catchError((error, stackTrace) async {
    Get.snackbar(
        'Error',
        'Something went wrong. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.1),
        colorText: Colors.red);
  });
}

  Future <Patient> getPatientDetails(String id) async {
    final snapshot = await _db.collection("Patients").where("id", isEqualTo: id).get();
    final userData = snapshot.docs.map((e) => Patient.fromSnapshot(e)).single;
    return userData;
  }

  // Count Number of Patient records in the collection
  Future<int> getPatientCount() async {
    final snapshot = await _db.collection("Patients").get();
    return snapshot.docs.length;
  }

  // Basing on the current date i want to show the number of patients that have been added today
  Future<int> getPatientsAddedToday() async {
    final snapshot = await _db.collection("Patients").where("createdAt", isEqualTo: DateTime.now().toString()).get();
    return snapshot.docs.length;
  }
}