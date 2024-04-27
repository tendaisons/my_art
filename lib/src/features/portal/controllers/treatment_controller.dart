import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_art/src/models/patient_models.dart';
import 'package:my_art/src/models/treatment_models.dart';
import 'package:my_art/src/repositories/patient_repository/patient_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_art/src/repositories/treatment_repository/treatment_repository.dart';

class TreatmentController extends GetxController {
  static TreatmentController get instance => Get.find();

  @override
  void dispose() {
    phoneNumberController.dispose();
    allergiesController.dispose();
    amountofMedicationController.dispose();
    medicationtypeController.dispose();
    examinationController.dispose();
    super.dispose();
  }

  /// TextField Controllers to get data from TextFields
  TextEditingController oiartnumberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController allergiesController = TextEditingController();
  TextEditingController medicationtypeController = TextEditingController();
  TextEditingController examinationController = TextEditingController();
  TextEditingController amountofMedicationController = TextEditingController();

  // Repositories
  final _treatmentRepo = Get.put(TreatmentRepository());

  // Get all patients from firestore
  Future<List<Treatment>> getAllTreatments() async =>
      await _treatmentRepo.getAllTreatments();

  // Search for patient by name
  Future<List<Treatment>> searchTreatment(String name) async {
    try {
      final snapshot = await _treatmentRepo.getAllTreatments();
      final searchResults = snapshot.where((element) {
        return (element as Patient)
            .fullname
            .toLowerCase()
            .contains(name.toLowerCase());
      }).toList();
      return searchResults
          .cast<Treatment>(); // Ensure the list is of type Patient
    } catch (e) {
      Get.snackbar('Error', 'Failed to search patients: $e',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.1),
          colorText: Colors.red);
      return [];
    }
  }

  updateTreatment(Treatment treatment) async {
    try {
      await _treatmentRepo.updateTreatmentRecord(treatment);
      Get.snackbar('Success', 'Treatment details updated successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.1),
          colorText: Colors.green);
    } catch (e) {
      Get.snackbar('Error', 'Failed to update patient details: $e',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.1),
          colorText: Colors.red);
    }
  }

  createTreatement(Treatment treatment) async {
    await _treatmentRepo.createTreatment(treatment);
  }

  // Get Patient Details
  Future<Treatment?> getTreatmentDetails(String id) async {
    final snapshot = await _treatmentRepo.getTreatmentDetails(id);
    return snapshot;
  }

  Future<int> getTreatmentsAddedToday() async {
    final snapshot = await _treatmentRepo.getAllTreatments();
    final today = DateTime.now();
    final todayTreatments = snapshot.where((element) {
      // Convert createdAt string to DateTime
      DateTime createdAt = DateTime.parse(element.createdAt);
      // Check if createdAt is on the same day as today
      return createdAt.day == today.day &&
          createdAt.month == today.month &&
          createdAt.year == today.year;
    }).toList();
    return todayTreatments.length;
  }

// Count Number of Patient records in the collection
  Future<int> getTreatmentCount() async {
    final snapshot = await _treatmentRepo.getAllTreatments();
    return snapshot.length;
  }
}
