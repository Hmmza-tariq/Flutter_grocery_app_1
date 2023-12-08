import 'package:abc/presentation/resources/color_manager.dart';
import 'package:abc/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';

import 'components/sign_up_body.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = "/signUp";
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.signUpTitle),
        centerTitle: true,
        backgroundColor: ColorManager.primaryColor,
      ),
      body: const SignUpBody(),
    );
  }
}
