import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_art/src/features/auth/pages/sign_up/sign_up_screen.dart';
import 'package:my_art/src/repositories/authentication_repository/authentication_repository.dart';
import '../../../../../constants/image_strings.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';

class SignInFooterWidget extends StatelessWidget {
  const SignInFooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("OR"),
        const SizedBox(height: tFormHeight - 20),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: const Image(image: AssetImage(tGoogleLogoImage), width: 20.0),
            onPressed: () {
              // Sign in with google
             AuthenticationRepository.instance.signInWithGoogle();
            },
            label: Text(tSignInWithGoogle.toUpperCase() , style: Theme.of(context).textTheme.titleLarge,),
          ),
        ),
        const SizedBox(height: tFormHeight - 20),
        TextButton(
          onPressed: () {
           Get.to(() => const SignUpScreen());
          },
          child: Text.rich(
            TextSpan(
                text: tDontHaveAnAccount,
                style: Theme.of(context).textTheme.bodyLarge,
                children: const [
                  TextSpan(text: tSignUp, style: TextStyle(color: Colors.blue))
                ]),
          ),
        ),
      ],
    );
  }
}