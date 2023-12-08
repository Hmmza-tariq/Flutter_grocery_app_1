import 'package:abc/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:abc/utilities/size_config.dart';
import 'package:flutter/services.dart';
import 'components/splash_screen_body.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: ColorManager.white,
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark),
        ),
        body: const SplashScreenBody());
  }
}
