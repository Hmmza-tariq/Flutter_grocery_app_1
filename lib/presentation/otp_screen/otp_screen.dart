import 'package:abc/presentation/resources/color_manager.dart';
import 'package:abc/presentation/resources/strings_manager.dart';
import 'package:abc/utilities/size_config.dart';
import 'package:flutter/material.dart';

import 'components/otp_body.dart';

class OTPScreen extends StatelessWidget {
  static const String routeName = "/otp";
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorManager.primaryColor,
        title: const Text(AppStrings.otpVerification),
      ),
      body: const OTPBody(),
    );
  }
}
