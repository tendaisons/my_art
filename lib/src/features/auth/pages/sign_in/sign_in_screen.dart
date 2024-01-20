import 'package:flutter/material.dart';
import '../../../../common_widgets/form_header_widget.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import 'widgets/sign_in_footer_widget.dart';
import 'widgets/sign_in_widget.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormHeaderWidget(
                  image: tWelcomeScreenImage,
                  title: tSignInTitle,
                  subTitle: tSignInSubTitle,
                  imageHeight: 0.15,
                ),
                SignInForm(),
                SignInFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
