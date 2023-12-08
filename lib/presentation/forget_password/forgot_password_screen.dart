import 'package:abc/presentation/resources/color_manager.dart';
import 'package:abc/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'components/forgot_password_body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const String routeName = "/forgot_password";
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.resetPassword),
        centerTitle: true,
        backgroundColor: ColorManager.primaryColor,
      ),
      body: const ForgotPasswordBody(),
    );
  }
}
