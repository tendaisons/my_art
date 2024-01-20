import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_art/src/constants/image_strings.dart';
import 'package:my_art/src/constants/text_strings.dart';
import 'package:my_art/src/features/auth/pages/sign_in/sign_in_screen.dart';

class SignUpFooterWidget extends StatelessWidget {
  const SignUpFooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('OR'),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
              onPressed: () {
                // Sign in with google
                // AuthenticationRepository.instance.
                // signInWithGoogle();
                
              },
              icon: const Image(
                image: AssetImage(tGoogleLogoImage),
                width: 20.0,
              ),
              label: Text(tSignInWithGoogle.toUpperCase(), style: Theme.of(context).textTheme.titleLarge)),
        ),
        TextButton(
          onPressed: (() {
            Get.to(() => const SigninScreen());
          }),
          child: Text.rich(TextSpan(children: [
            TextSpan(
              text: tAlreadyHaveAnAccount,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const TextSpan(text: tSignIn)
          ]))
          )
      ],
    );
  }
}
