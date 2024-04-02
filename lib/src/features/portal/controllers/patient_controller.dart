import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_art/src/models/patient_models.dart';
import 'package:my_art/src/repositories/patient_repository/patient_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class PatientController extends GetxController {
  static PatientController get instance => Get.find();

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

  // Repositories
  final _patientRepo = Get.put(PatientRepository());

  // Get all patients from firestore
  Future <List<Patient>> getAllPatients() async => await _patientRepo.getAllPatients();


  updateRecord(Patient patient) async {
    await _patientRepo.updatePatientRecord(patient);

  }

  createPatient(Patient patient) async {
    await _patientRepo.createPatient(patient);
  }

// Basing on the current date i want to show the number of patients that have been added today
//   Future <int> getPatientsAddedToday() async {
//     final snapshot = await _patientRepo.getAllPatients();
//     final today = DateTime.now();
//     final todayPatients = snapshot.where((element) => element.createdAt.day == today.day).toList();
//     return todayPatients.length;
//   }
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