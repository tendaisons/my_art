import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:my_art/main.dart';
import 'package:my_art/utils.dart';

import '../src/constants/text_strings.dart';

class AddPatient extends StatefulWidget {
  const AddPatient({super.key});

  @override
  State<AddPatient> createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  String? _selectedValueCovid;
  String? _selectedValueDiabetes;
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
          'Add Patient ',
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
                  TextFormField(
                    //controller: controller.email,
                    validator: (value) => value!.isNumericOnly
                        ? null
                        : 'Please enter a valid OI ART Number',
                    decoration: const InputDecoration(
                      hintText: artNumber,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    //controller: controller.email,
                    validator: (value) => value!.isAlphabetOnly
                        ? null
                        : 'Please enter a valid Patient Full Name',
                    decoration: const InputDecoration(
                      hintText: patientName,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    //controller: controller.email,
                    validator: (value) => value!.isNumericOnly
                        ? null
                        : 'Please enter a valid Patient Contact Number',
                    decoration: const InputDecoration(
                      hintText: patientPhone,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    //controller: controller.email,
                    validator: (value) => value!.isEmail
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
                    //controller: controller.email,
                    validator: (value) => value!.isAlphabetOnly
                        ? null
                        : 'Please enter a valid Address',
                    decoration: const InputDecoration(
                      hintText: 'Address',
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
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
                    //controller: controller.email,
                    validator: (value) => value!.isAlphabetOnly
                        ? null
                        : 'Please enter a valid City',
                    decoration: const InputDecoration(
                      hintText: 'City',
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    //controller: controller.email,
                    validator: (value) => value!.isAlphabetOnly
                        ? null
                        : 'Please enter a valid Allergies',
                    decoration: const InputDecoration(
                      hintText: 'Allergies',
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    //controller: controller.email,
                    validator: (value) => value!.isAlphabetOnly
                        ? null
                        : 'Please enter a valid Note',
                    decoration: const InputDecoration(
                      hintText: 'Note',
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Covid 19 Vaccination Status',
                    style: Theme.of(context).textTheme.bodyLarge,
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
                    style: Theme.of(context).textTheme.bodyLarge,
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
                      onPressed: () {},
                      // isLoading
                      //     ? null
                      //     : () {
                      //   if (formKey.currentState!.validate()) {
                      //     setState(() {
                      //       isLoading = true;
                      //     });
                      //     SignInController.instance
                      //         .logInUser(controller.email.text.trim(),
                      //         controller.password.text.trim())
                      //         .then((_) {
                      //       setState(() {
                      //         isLoading = false;
                      //       });
                      //     });
                      //   }
                      // },
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
