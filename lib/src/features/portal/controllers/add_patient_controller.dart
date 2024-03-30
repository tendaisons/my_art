import 'package:get/get.dart';
import 'package:my_art/src/models/patient_models.dart';

class PatientController extends GetxController {
  static PatientController get instance => Get.find();

  // Repositories
  final _patientRepo = Get.put(PatientRepository());

  // Get all patients from firestore
  Future<List<Patient>> getAllPatients(String uid) async => await _patientRepo.getAllPatientss(uid);

}