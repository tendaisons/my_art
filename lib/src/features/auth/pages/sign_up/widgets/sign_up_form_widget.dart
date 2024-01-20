import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_art/src/constants/sizes.dart';
import 'package:my_art/src/constants/text_strings.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class SignUpFormWidget extends StatefulWidget {
  const SignUpFormWidget({super.key});

  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
   bool passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(SignUpController());
    final formKey = GlobalKey<FormState>();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              // controller: controller.fullname,
               validator: (value) => value?.isEmpty ?? true ? 'Please enter your full name' : null,
              decoration: const InputDecoration(
                hintText: tFullName,
                prefixIcon: Icon(LineAwesomeIcons.user),
              ),
            ),
            const SizedBox(
              height: tFormHeight - 20,
            ),
            TextFormField(
              // controller: controller.email,
              validator: (value) => value?.isEmail ?? false ? null : 'Please enter a valid email',
              decoration: const InputDecoration(
                hintText: tEmail,
                prefixIcon: Icon(LineAwesomeIcons.envelope),
              ),
            ),
            const SizedBox(
              height: tFormHeight - 20,
            ),
            TextFormField(
              // controller: controller.phoneNo,
              validator: (value) => value!.length >= 10 ? null : 'Please enter a valid phone number',
              decoration: const InputDecoration(
                  hintText: tPhoneNo, prefixIcon: Icon(LineAwesomeIcons.phone)),
            ),
            const SizedBox(
              height: tFormHeight - 20,
            ),
            TextFormField(
              // controller: controller.password,
              obscureText: !passwordVisible,
              validator: (value) => value!.length >= 8 ? null : 'Password must be 8 characters long',
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
                      : LineAwesomeIcons.eye
                  ),
                ),
                  
                  ),
            ),
            const SizedBox(
              height: tFormHeight - 10,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      // Signup with phone number
                      // SignUpController.instance.phoneAuthentication(
                      //   controller.phoneNo.text.trim());
                      // Get.to(() => const OTPScreen());

                      // Signup with email and password
                      // SignUpController.instance.signUpUser(controller.email.text.trim(), controller.password.text.trim());

                      // Signup with email and password Using User Model
                      // final user = UserModel(
                      //   email: controller.email.text.trim(),
                      //   password: controller.password.text.trim(),
                      //   fullname: controller.fullname.text.trim(),
                      //   phoneNo: controller.phoneNo.text.trim(),
                      //   createdAt: DateTime.now().toString().substring(0, 10)
                      // );
                      // SignUpController.instance.createUser(user);
                    }
                  },
                  child: Text(tSignUp.toUpperCase())),
            )
          ],
        ),
      ),
    );
  }
}
