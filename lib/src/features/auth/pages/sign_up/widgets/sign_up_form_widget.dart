import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_art/src/constants/sizes.dart';
import 'package:my_art/src/constants/text_strings.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:my_art/src/features/auth/controllers/sign_up_controller.dart';
import 'package:my_art/src/models/app_models.dart';

class SignUpFormWidget extends StatefulWidget {
  const SignUpFormWidget({super.key});

  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  bool passwordVisible = false;
  bool isLoading = false;
  TextEditingController dateOfBirth = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final formKey = GlobalKey<FormState>();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.fullname,
              validator: (value) =>
                  value?.isEmpty ?? true ? 'Please enter your full name' : null,
              decoration: const InputDecoration(
                hintText: tFullName,
                prefixIcon: Icon(LineAwesomeIcons.user),
              ),
            ),
            const SizedBox(
              height: tFormHeight - 20,
            ),
            TextFormField(
              controller: controller.email,
              validator: (value) =>
                  value?.isEmail ?? false ? null : 'Please enter a valid email',
              decoration: const InputDecoration(
                hintText: tEmail,
                prefixIcon: Icon(LineAwesomeIcons.envelope),
              ),
            ),
            const SizedBox(
              height: tFormHeight - 20,
            ),
            TextFormField(
              controller: controller.phoneNo,
              validator: (value) => value!.length >= 10
                  ? null
                  : 'Please enter a valid phone number',
              decoration: const InputDecoration(
                  hintText: tPhoneNo, prefixIcon: Icon(LineAwesomeIcons.phone)),
            ),
            // Location
            const SizedBox(
              height: tFormHeight - 20,
            ),
            TextFormField(
              controller: controller.location,
              validator: (value) =>
                  value?.isEmpty ?? true ? 'Please enter a home address' : null,
              decoration: const InputDecoration(
                  hintText: "Address", prefixIcon: Icon(LineAwesomeIcons.home)),
            ),
            // Date time picker
            const SizedBox(
              height: tFormHeight - 20,
            ),
            TextFormField(
              controller: dateOfBirth,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Age is required';
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: "Date of Birth",
                prefixIcon: Icon(LineAwesomeIcons.calendar),
              ),
              onTap: () async {
                DateTime? datepicked = await showDatePicker(
                    context: context,
                    initialDate: DateTime(2005),
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2005));

                if (datepicked != null) {
                  setState(() {
                    dateOfBirth.text =
                        DateFormat("yyyy-MM-dd").format(datepicked);
                  });
                }
              },
            ),
            const SizedBox(
              height: tFormHeight - 20,
            ),
            TextFormField(
              controller: controller.password,
              obscureText: !passwordVisible,
              validator: (value) {
                if (value!.length < 8) {
                  return 'Password must be at least 8 characters long';
                }
                if (!value.contains(RegExp(r'[A-Z]'))) {
                  return 'Password must contain at least one uppercase letter';
                }
                if (!value.contains(RegExp(r'[a-z]'))) {
                  return 'Password must contain at least one lowercase letter';
                }
                if (!value.contains(RegExp(r'[0-9]'))) {
                  return 'Password must contain at least one digit';
                }
                if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                  return 'Password must contain atleast one special character';
                }
                // Add more complexity rules as needed
                return null;
              },
              decoration: InputDecoration(
                hintText: tPassword,
                prefixIcon: const Icon(LineAwesomeIcons.lock),
                suffixIcon: IconButton(
                  onPressed: () {
                    // Show or hide password
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  },
                  icon: Icon(passwordVisible == true
                      ? LineAwesomeIcons.eye_slash
                      : LineAwesomeIcons.eye),
                ),
              ),
            ),
            const SizedBox(
              height: tFormHeight - 15,
            ),
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

                            final pass = controller.password.text.trim();
                            final mail = controller.email.text.trim();

                            SignUpController.instance.signUpUser(email: mail, password: pass)
                            .then((_) {
                              setState(() {
                                isLoading = false;
                              });
                              final user = UserModel(
                                uid: FirebaseAuth.instance.currentUser!.uid,
                                email: controller.email.text.trim(),
                                fullname: controller.fullname.text.trim(),
                                phoneNo: controller.phoneNo.text.trim(),
                                location: controller.location.text.trim(),
                                dateofbirth: dateOfBirth.text.trim(),
                                createdAt:
                                    DateTime.now().toString().substring(0, 10));

                            SignUpController.instance
                                .createUser(user);
                            });
                          }
                        },
                  child: isLoading
                      ? Container(
                          height: 16,
                          width: 16,
                          child: const CircularProgressIndicator(
                              color: Colors.white, strokeWidth: 2.0),
                        )
                      : Text(tSignUp.toUpperCase())),
            )
          ],
        ),
      ),
    );
  }
}