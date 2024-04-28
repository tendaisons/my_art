import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_art/src/features/portal/controllers/patient_controller.dart';
import 'package:my_art/src/features/portal/controllers/treatment_controller.dart';
import 'package:my_art/src/models/patient_models.dart';
import 'package:my_art/src/models/treatment_models.dart';
import 'package:my_art/utils.dart';
import 'package:my_art/widgets/navbar_roots.dart';

import '../src/constants/text_strings.dart';

class AddMed extends StatefulWidget {
  const AddMed({super.key});

  @override
  State<AddMed> createState() => _AddMedState();
}

class _AddMedState extends State<AddMed> {
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  String? _selectedValueCovid;
  String? _selectedValueDiabetes;

// Generate Ids
//   String generatePrimaryKey() {
//     return Random().nextInt(1000000000).toString();
//   }

  String generatePrimaryKey() {
    final int number = Random().nextInt(1000000000);
    final String letter = String.fromCharCode(
        Random().nextInt(26) + 65); // Generates a random uppercase letter (A-Z)
    return 'A$number$letter';
  }

  final controller = Get.put(TreatmentController());
  @override
  Widget build(BuildContext context) {
    double baseWidth = 498;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 235, 242, 255),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 235, 242, 255),
        title: Text(
          'Add Treatment ',
          style: SafeGoogleFont(
            'Poppins',
            fontSize: 21 * ffem,
            fontWeight: FontWeight.w600,
            height: 1.5 * ffem / fem,
            color: Color(0xff24284d),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // TextFormField(
                  //   controller: controller.oiartnumberController,
                  //   validator: (value) => value!.isNumericOnly
                  //       ? null
                  //       : 'Please enter a valid OI ART Number',
                  //   decoration: const InputDecoration(
                  //     hintText: artNumber,
                  //   ),
                  // ),
                  // SizedBox(height: 20),
                  TextFormField(
                    controller: controller.nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a valid Patient Full Name';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: patientName,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: controller.medication_TypeController,
                    validator: (value) => value!.isNumericOnly
                        ? null
                        : 'Please enter a valid Type of Medication',
                    decoration: const InputDecoration(
                      hintText: medicationtypet,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: controller.examinationController,
                    validator: (value) => value!.isAlphabetOnly
                        ? null
                        : 'Please enter a valid Examination',
                    decoration: const InputDecoration(
                      hintText: examinationt,
                    ),
                  ),
                  SizedBox(height: 20),

                  TextFormField(
                    controller: controller.amountofMedicationController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a valid Amount of Medication';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: amountofmedicationt,
                    ),
                  ),
                  SizedBox(height: 20),

                  // TextFormField(
                  //   controller: controller.allergiesController,
                  //   validator: (value) => value!.isAlphabetOnly
                  //       ? null
                  //       : 'Please enter a valid Allergies',
                  //   decoration: const InputDecoration(
                  //     hintText: 'Allergies',
                  //   ),
                  // ),
                  SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: isLoading
                          ? null
                          : () {
                              if (formKey.currentState!.validate()) {
                                setState(() {
                                  isLoading = true;
                                });
                                TreatmentController.instance
                                    .createTreatment(Treatment(
                                  id: generatePrimaryKey(),
                                  fullname:
                                      controller.nameController.text.trim(),
                                  medication_Type: controller
                                      .medication_TypeController.text
                                      .trim(),
                                  examination: controller
                                      .examinationController.text
                                      .trim(),
                                  amountofMedication: controller
                                      .amountofMedicationController.text
                                      .trim(),
                                  createdAt: DateTime.now()
                                      .toString()
                                      .substring(0, 10),
                                  updatedAt: DateTime.now()
                                      .toString()
                                      .substring(0, 10),
                                ))
                                    .then((_) {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  Get.to(() => NavBarRoots());
                                });
                              }
                            },
                      child: isLoading
                          ? Container(
                              height: 16,
                              width: 16,
                              child: const CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ))
                          : Text(
                              (save.toUpperCase()),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
