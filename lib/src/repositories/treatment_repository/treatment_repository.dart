import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_art/src/models/patient_models.dart';
import 'package:my_art/src/models/treatment_models.dart';

class TreatmentRepository extends GetxController {
  static TreatmentRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createTreatment(Treatment treatment) {
    _db
        .collection("Treatment")
        .add(treatment.toJson())
        .whenComplete(
          () => Get.snackbar('Success', 'Treatment Saved Successfully',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.1),
              colorText: const Color.fromARGB(255, 156, 189, 157)),
        )
        .catchError((error, stackTrace) async {
      Get.snackbar('Error', 'Something went wrong. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.1),
          colorText: Colors.red);
    });
  }

  getAllTreatments() async {
    final snapshot = await _db.collection("Treatment").get();
    return snapshot.docs.map((e) => Treatment.fromSnapshot(e)).toList();
  }

// Update user details
  updateTreatmentRecord(Treatment treatment) async {
    await _db
        .collection("Treatments")
        .doc(treatment.id)
        .update(treatment.toJson())
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

  Future<Treatment> getTreatmentDetails(String id) async {
    try {
      final snapshot =
          await _db.collection("Patients").where("id", isEqualTo: id).get();
      if (snapshot.docs.isNotEmpty) {
        return Treatment.fromSnapshot(snapshot.docs.first);
      } else {
        throw Exception('Patient not found');
      }
    } catch (e) {
      throw Exception('Failed to fetch patient details: $e');
    }
  }

  // Count Number of Patient records in the collection
  Future<int> getPatientCount() async {
    final snapshot = await _db.collection("Patients").get();
    return snapshot.docs.length;
  }

  // Basing on the current date i want to show the number of patients that have been added today
  Future<int> getPatientsAddedToday() async {
    final snapshot = await _db
        .collection("Patients")
        .where("createdAt", isEqualTo: DateTime.now().toString())
        .get();
    return snapshot.docs.length;
  }
}
