import 'package:abc/presentation/resources/strings_manager.dart';
import 'package:abc/presentation/sign_in/components/sign_in_form.dart';
import 'package:abc/utilities/size_config.dart';
import 'package:flutter/material.dart';

import 'complete_profile_form.dart';

// ignore: must_be_immutable
class CompleteProfileBody extends StatelessWidget {
  late ScreenArgs userData;
  CompleteProfileBody({Key? key, required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String userName = userData.email.split("@")[0];
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
              child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.03),
              Text(
                "Complete $userName Profile",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: SizeConfig.getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2),
              ),
              const Text(
                AppStrings.completeInfo,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.06),
              CompleteProfileForm(userData: userData),
              SizedBox(height: SizeConfig.getProportionateScreenHeight(30)),
              Text(
                AppStrings.kAcceptTerms,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(height: SizeConfig.getProportionateScreenHeight(30)),
            ],
          )),
        ),
      ),
    );
  }
}
