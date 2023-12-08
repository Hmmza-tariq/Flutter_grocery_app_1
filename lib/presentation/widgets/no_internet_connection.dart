import 'package:abc/presentation/resources/assets_manager.dart';
import 'package:abc/presentation/resources/font_manager.dart';
import 'package:abc/presentation/resources/strings_manager.dart';
import 'package:abc/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'default_button.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          child: Image.asset(
            ImageAssets.no_connection,
            fit: BoxFit.contain,
          ),
        ),
        const Text(
          AppStrings.noInternet,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: FontSize.s28,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: AppSize.s10,
        ),
        const Opacity(
          opacity: 0.57,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p60),
            child: Text(
              AppStrings.noInternetSub,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: FontSize.s16,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppPadding.p14),
          child: DefaultButton(
            onPressed: () {},
            backgroundColor: const Color(0xff57bfe9),
            foregroundColor: Colors.white,
            text: AppStrings.tryAgain,
            width: 250,
            height: 60,
          ),
        )
      ],
    );
  }
}
