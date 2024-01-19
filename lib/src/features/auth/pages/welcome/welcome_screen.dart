import 'package:flutter/material.dart';
import 'package:my_art/src/constants/image_strings.dart';
import 'package:my_art/src/constants/sizes.dart';
import 'package:my_art/src/constants/text_strings.dart';
import '../../../../constants/colors.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? tSecondaryColor : tPrimaryColor,
      body: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Hero(
              tag: 'welcome-image-tag',
              child: Image(
                image: const AssetImage(tWelcomeScreenImage),
                height: height * 0.6)),
            Column(
              children: [
                Text(tWelcomeTitle,
                    style: Theme.of(context).textTheme.displaySmall),
                Text(tWelcomeSubTitle,
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    key: const Key('signin-button'),
                    onPressed: () {
                    //  Get.to(() => const SigninScreen());
                    },
                    child: Text(tSignIn.toUpperCase()),
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Get.to(() => const SignUpScreen());
                    },
                    child: Text(tSignUp.toUpperCase()),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
