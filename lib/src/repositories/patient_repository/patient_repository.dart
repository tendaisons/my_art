import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:my_art/src/models/patient_models.dart';

class UserRepository extends GetxController {
static UserRepository get instance => Get.find();

final _db = FirebaseFirestore.instance;

createPatient(Patient patient) {

}
}
