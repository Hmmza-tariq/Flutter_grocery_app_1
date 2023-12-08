import 'package:abc/presentation/resources/strings_manager.dart';
import 'package:abc/presentation/resources/values_manager.dart';
import 'package:abc/presentation/widgets/custom_header.dart';
import 'package:abc/presentation/widgets/social_media_box.dart';
import 'package:flutter/material.dart';

import 'sign_up_form.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p10, vertical: AppPadding.p25),
        child: Column(
          children: [
            const CustomHeader(
              title: AppStrings.createAccount,
              subTitle: AppStrings.createAccountSub,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            const SignUpForm(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            const SocialMediaBox()
          ],
        ),
      ),
    );
  }
}
