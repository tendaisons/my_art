import 'package:flutter/material.dart';
import 'package:my_art/src/common_widgets/form_header_widget.dart';
import 'package:my_art/src/constants/image_strings.dart';
import 'package:my_art/src/constants/sizes.dart';
import 'package:my_art/src/constants/text_strings.dart';

import 'widgets/sign_up_footer_widget.dart';
import 'widgets/sign_up_form_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child:  const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormHeaderWidget(
                image: tWelcomeScreenImage,
                title:tSignUpTitle, 
                subTitle: tSignUpSubTitle,
                imageHeight: 0.15,
              ),
              SignUpFormWidget(),
              SignUpFooterWidget(),
            ],
          ),
        ),
      ),
      ),
    );
  }
}