import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
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
  bool passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    //final controller = Get.put(SignInController());
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
             // controller: controller.email,
              validator:(value) => value!.isEmail ? null : 'Please enter a valid email',
              decoration: const InputDecoration(
                prefixIcon: Icon(LineAwesomeIcons.envelope),
                hintText: tEmail,
              ),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              key: const Key('password-field'),
              //controller: controller.password,
              obscureText: !passwordVisible,
              validator: (value) => value!.length >= 8 ? null : 'Password must be 8 characters long',
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
                      : LineAwesomeIcons.eye
                  ),
                ),
              ),
            ),
            const SizedBox(height: tFormHeight - 20),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {
                    // ForgetPasswordScreen.buildShowModalBottomSheet(context);
                  },
                  child: Text(tForgetPassword, style: Theme.of(context).textTheme.bodyMedium,)),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // if (formKey.currentState!.validate()) {
                  //   SignInController.instance.logInUser(
                  //       controller.email.text.trim(),
                  //       controller.password.text.trim());
                  // }
                },
                child: Text(tSignIn.toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

  class EmailValidator {
  static String? validate(String? value) {
    return value==null ||  value.isEmpty ? "Please enter an email!" : null;
  }
}

class PasswordValidator {
  static String? validate(String? value) {
    return value==null ||value.isEmpty ? "Password must contain atleast 8 characters." : null;
  }
}