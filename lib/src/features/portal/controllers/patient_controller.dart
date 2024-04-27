import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_art/src/models/patient_models.dart';
import 'package:my_art/src/repositories/patient_repository/patient_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PatientController extends GetxController {
  static PatientController get instance => Get.find();

  @override
  void dispose() {
    oiartnumberController.dispose();
    nameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    ageController.dispose();
    genderController.dispose();
    addressController.dispose();
    countryController.dispose();
    provinceController.dispose();
    cityController.dispose();
    noteController.dispose();
    diabetesController.dispose();
    covidVaccinationController.dispose();
    allergiesController.dispose();
    amountofMedicationController.dispose();
    medication_TypeController.dispose();
    examinationController.dispose();
    super.dispose();
  }

  /// TextField Controllers to get data from TextFields
  TextEditingController oiartnumberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController provinceController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController diabetesController = TextEditingController();
  TextEditingController covidVaccinationController = TextEditingController();
  TextEditingController allergiesController = TextEditingController();
  TextEditingController medication_TypeController = TextEditingController();
  TextEditingController examinationController = TextEditingController();
  TextEditingController amountofMedicationController = TextEditingController();

  // Repositories
  final _patientRepo = Get.put(PatientRepository());

  // Get all patients from firestore
  Future<List<Patient>> getAllPatients() async =>
      await _patientRepo.getAllPatients();

  // Search for patient by name
  Future<List<Patient>> searchPatient(String name) async {
    try {
      final snapshot = await _patientRepo.getAllPatients();
      final searchResults = snapshot.where((element) {
        return (element as Patient)
            .fullname
            .toLowerCase()
            .contains(name.toLowerCase());
      }).toList();
      return searchResults
          .cast<Patient>(); // Ensure the list is of type Patient
    } catch (e) {
      Get.snackbar('Error', 'Failed to search patients: $e',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.1),
          colorText: Colors.red);
      return [];
    }
  }

  updatePatient(Patient patient) async {
    try {
      await _patientRepo.updatePatientRecord(patient);
      Get.snackbar('Success', 'Patient details updated successfully',
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

  createPatient(Patient patient) async {
    await _patientRepo.createPatient(patient);
  }

  // Get Patient Details
  Future<Patient?> getPatientDetails(String id) async {
    final snapshot = await _patientRepo.getPatientDetails(id);
    return snapshot;
  }

  Future<int> getPatientsAddedToday() async {
    final snapshot = await _patientRepo.getAllPatients();
    final today = DateTime.now();
    final todayPatients = snapshot.where((element) {
      // Convert createdAt string to DateTime
      DateTime createdAt = DateTime.parse(element.createdAt);
      // Check if createdAt is on the same day as today
      return createdAt.day == today.day &&
          createdAt.month == today.month &&
          createdAt.year == today.year;
    }).toList();
    return todayPatients.length;
  }

// Count Number of Patient records in the collection
  Future<int> getPatientCount() async {
    final snapshot = await _patientRepo.getAllPatients();
    return snapshot.length;
  }
}
