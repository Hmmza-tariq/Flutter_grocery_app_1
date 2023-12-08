import 'package:abc/presentation/resources/color_manager.dart';
import 'package:abc/presentation/resources/strings_manager.dart';
import 'package:abc/presentation/sign_in/components/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'component/complete_profile_body.dart';

class CompleteProfileScreen extends StatelessWidget {
  static const String routeName = "/complete_profile";
  const CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userData = ModalRoute.of(context)!.settings.arguments as ScreenArgs;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorManager.primaryColor,
        title: const Text(AppStrings.completeProfile),
      ),
      body: CompleteProfileBody(userData: userData),
    );
  }
}
