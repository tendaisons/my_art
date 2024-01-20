import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:my_art/src/features/auth/controllers/sign_in_controller.dart';
import 'package:my_art/src/features/auth/pages/forget_password/forget_password_email/forget_password_mail.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool isLoading = false;
  bool passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.email,
              validator: (value) =>
                  value!.isEmail ? null : 'Please enter a valid email',
              decoration: const InputDecoration(
                prefixIcon: Icon(LineAwesomeIcons.envelope),
                hintText: tEmail,
              ),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              key: const Key('password-field'),
              controller: controller.password,
              obscureText: !passwordVisible,
              validator: (value) => value!.length >= 8
                  ? null
                  : 'Password must be 8 characters long',
              decoration: InputDecoration(
                prefixIcon: const Icon(LineAwesomeIcons.lock),
                hintText: tPassword,
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
            const SizedBox(height: tFormHeight - 20),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {
                    Get.to(() => const ForgetPasswordMailScreen());
                  },
                  child: Text(
                    tForgetPassword,
                    style: Theme.of(context).textTheme.bodyMedium,
                  )),
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
                                  SignInController.instance
                                      .logInUser(controller.email.text.trim(),
                                          controller.password.text.trim())
                                      .then((_) {
                                    setState(() {
                                      isLoading = false;
                                    });
                                  });
                                }
                              },
                        child: isLoading 
                        ? Container(
                          height: 16,
                          width: 16,
                          child: const CircularProgressIndicator(color: Colors.white, strokeWidth: 2,))
                        :Text((tSignIn.toUpperCase()),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}