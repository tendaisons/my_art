import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_art/src/models/treatment_models.dart';

class TreatmentRepository extends GetxController {
  static TreatmentRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createTreatment(Treatment treatment) {
    _db
        .collection("Treatments")
        .add(treatment.toJson())
        .whenComplete(
          () => Get.snackbar('Success', 'Treatment Saved Successfully',
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
          await _db.collection("treatment").where("id", isEqualTo: id).get();
      if (snapshot.docs.isNotEmpty) {
        return Treatment.fromSnapshot(snapshot.docs.first);
      } else {
        throw Exception('Treatment not found');
      }
    } catch (e) {
      throw Exception('Failed to fetch treatment details: $e');
    }
  }

  // Count Number of Patient records in the collection
  Future<int> getTreatmentCount() async {
    final snapshot = await _db.collection("Treatments").get();
    return snapshot.docs.length;
  }

  // Basing on the current date i want to show the number of patients that have been added today
  Future<int> getTreatmentAddedToday() async {
    final snapshot = await _db
        .collection("Treatments")
        .where("createdAt", isEqualTo: DateTime.now().toString())
        .get();
    return snapshot.docs.length;
  }
}
