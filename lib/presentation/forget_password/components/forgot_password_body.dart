import 'package:abc/presentation/resources/strings_manager.dart';
import 'package:abc/presentation/resources/values_manager.dart';
import 'package:abc/presentation/widgets/custom_header.dart';
import 'package:flutter/material.dart';

import 'forgot_password_form.dart';

class ForgotPasswordBody extends StatelessWidget {
  const ForgotPasswordBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p20),
        child: Center(
          child: Column(
            children: [
              const CustomHeader(
                title: AppStrings.forgetPassword,
                subTitle: AppStrings.forgetPassSub,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              const ForgotPasswordForm(),
            ],
          ),
        ),
      ),
    ));
  }
}
