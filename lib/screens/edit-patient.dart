import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_art/src/features/portal/controllers/patient_controller.dart';
import 'package:my_art/src/models/patient_models.dart';
import 'package:my_art/utils.dart';
import 'package:my_art/widgets/navbar_roots.dart';

import '../src/constants/text_strings.dart';

class EditPatient extends StatefulWidget {
  final Patient item;

  const EditPatient({super.key, required this.item});

  @override
  State<EditPatient> createState() => _EditPatientState();
}

class _EditPatientState extends State<EditPatient> {
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  String? _selectedValueCovid;
  String? _selectedValueDiabetes;

  late final controller = Get.put(PatientController());

  @override
  void initState() {
    super.initState();
    controller.oiartnumberController.text = widget.item.oiartnumber;
    controller.nameController.text = widget.item.fullname;
    controller.phoneNumberController.text = widget.item.phoneNo;
    controller.emailController.text = widget.item.email;
    controller.ageController.text = widget.item.age;
    controller.genderController.text = widget.item.gender;
    controller.addressController.text = widget.item.address;
    controller.countryController.text = widget.item.country;
    controller.provinceController.text = widget.item.province;
    controller.cityController.text = widget.item.city;
    controller.allergiesController.text = widget.item.allergies;
    controller.noteController.text = widget.item.note;
    _selectedValueCovid = widget.item.covidVaccination;
    _selectedValueDiabetes = widget.item.diabetes;
  }

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
            'Edit Patient ',
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
                child: FutureBuilder(
                    future: controller.getPatientDetails(widget.item.id),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          Patient? patientData = snapshot.data as Patient;
                          if (patientData != null) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  controller: controller.oiartnumberController,
                                  validator: (value) =>
                                  value!.isNumericOnly
                                      ? null
                                      : 'Please enter a valid OI ART Number',
                                  decoration: const InputDecoration(
                                    hintText: artNumber,
                                  ),
                                ),
                                SizedBox(height: 20),
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
                                  controller: controller.phoneNumberController,
                                  validator: (value) =>
                                  value!.isNumericOnly
                                      ? null
                                      : 'Please enter a valid Patient Contact Number',
                                  decoration: const InputDecoration(
                                    hintText: patientPhone,
                                  ),
                                ),
                                SizedBox(height: 20),
                                TextFormField(
                                  controller: controller.emailController,
                                  validator: (value) =>
                                  value!.isEmail
                                      ? null
                                      : 'Please enter a valid Patient Email Address',
                                  decoration: const InputDecoration(
                                    hintText: patientEmail,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        validator: (value) =>
                                        value!.isNumericOnly
                                            ? null
                                            : 'Please enter a valid Patient Age',
                                        controller: controller.ageController,
                                        expands: false,
                                        decoration: const InputDecoration(
                                          labelText: age,
                                          prefixIcon: Icon(Icons.abc),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 25),
                                    Expanded(
                                      child: TextFormField(
                                        controller: controller.genderController,
                                        validator: (value) =>
                                        value!
                                            .isAlphabetOnly
                                            ? null
                                            : 'Please enter a valid Patient Gender',
                                        expands: false,
                                        decoration: const InputDecoration(
                                          labelText: gender,
                                          prefixIcon: Icon(Icons.person),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                TextFormField(
                                  controller: controller.addressController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a valid Address';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    hintText: 'Address',
                                  ),
                                ),
                                SizedBox(height: 20),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        validator: (value) =>
                                        value!.isAlphabetOnly
                                            ? null
                                            : 'Please enter a valid Country',
                                        controller: controller
                                            .countryController,
                                        expands: false,
                                        decoration: const InputDecoration(
                                          labelText: country,
                                          prefixIcon: Icon(Icons.abc),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 25),
                                    Expanded(
                                      child: TextFormField(
                                        validator: (value) =>
                                        value!.isAlphabetOnly
                                            ? null
                                            : 'Please enter a valid Province',
                                        controller: controller
                                            .provinceController,
                                        expands: false,
                                        decoration: const InputDecoration(
                                          labelText: province,
                                          prefixIcon: Icon(Icons.person),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                TextFormField(
                                  controller: controller.cityController,
                                  validator: (value) =>
                                  value!.isAlphabetOnly
                                      ? null
                                      : 'Please enter a valid City',
                                  decoration: const InputDecoration(
                                    hintText: 'City',
                                  ),
                                ),
                                SizedBox(height: 20),
                                TextFormField(
                                  controller: controller.allergiesController,
                                  validator: (value) =>
                                  value!.isAlphabetOnly
                                      ? null
                                      : 'Please enter a valid Allergies',
                                  decoration: const InputDecoration(
                                    hintText: 'Allergies',
                                  ),
                                ),
                                SizedBox(height: 20),
                                TextFormField(
                                  controller: controller.noteController,
                                  validator: (value) =>
                                  value!.isAlphabetOnly
                                      ? null
                                      : 'Please enter a valid Note',
                                  decoration: const InputDecoration(
                                    hintText: 'Note',
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  'Covid 19 Vaccination Status',
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .bodyLarge,
                                ),
                                SizedBox(height: 10),
                                RadioListTile<String>(
                                  title: const Text('Yes'),
                                  value: 'Yes',
                                  groupValue: _selectedValueCovid,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedValueCovid = value;
                                    });
                                  },
                                ),
                                RadioListTile<String>(
                                  title: const Text('No'),
                                  value: 'No',
                                  groupValue: _selectedValueCovid,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedValueCovid = value;
                                    });
                                  },
                                ),
                                SizedBox(height: 20),
                                Text(
                                  'Diabetes',
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .bodyLarge,
                                ),
                                SizedBox(height: 10),
                                RadioListTile<String>(
                                  title: const Text('Yes'),
                                  value: 'Yes',
                                  groupValue: _selectedValueDiabetes,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedValueDiabetes = value;
                                    });
                                  },
                                ),
                                RadioListTile<String>(
                                  title: const Text('No'),
                                  value: 'No',
                                  groupValue: _selectedValueDiabetes,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedValueDiabetes = value;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: isLoading
                                        ? null
                                        : () {
                                      if (formKey.currentState!
                                          .validate()) {
                                        setState(() {
                                          isLoading = true;
                                        });
                                        PatientController.instance
                                            .updatePatient(Patient(
                                          id: '',
                                          oiartnumber: controller
                                              .oiartnumberController.text
                                              .trim(),
                                          fullname: controller
                                              .nameController.text
                                              .trim(),
                                          phoneNo: controller
                                              .phoneNumberController.text
                                              .trim(),
                                          email: controller
                                              .emailController.text
                                              .trim(),
                                          age: controller.ageController.text
                                              .trim(),
                                          gender: controller
                                              .genderController.text
                                              .trim(),
                                          address: controller
                                              .addressController.text
                                              .trim(),
                                          country: controller
                                              .countryController.text
                                              .trim(),
                                          province: controller
                                              .provinceController.text
                                              .trim(),
                                          city: controller
                                              .cityController.text
                                              .trim(),
                                          note: controller
                                              .noteController.text
                                              .trim(),
                                          allergies: controller
                                              .allergiesController.text
                                              .trim(),
                                          diabetes: _selectedValueDiabetes,
                                          covidVaccination:
                                          _selectedValueCovid,
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
                                        child:
                                        const CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: 2,
                                        ))
                                        : Text(
                                      (tUpdate.toUpperCase()),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return const Center(
                              child: Text('No Patients found!'),
                            );
                          }
                        } else {
                          return const Center(
                            child: Text('No Patients found!'),
                          );
                        }
                      } else if (snapshot.hasError) {
                        return Center(child: Text(snapshot.error.toString()));
                      } else {
                        return const Center(
                            child: Text('Something went wrong'));
                      }
                    }),
              ),
            ),
          ),
        ));
  }
}
