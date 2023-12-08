import 'package:abc/presentation/resources/styles_manager.dart';
import 'package:abc/presentation/sign_in/sign_in_screen.dart';
import 'package:abc/presentation/resources/assets_manager.dart';
import 'package:abc/presentation/resources/color_manager.dart';
import 'package:abc/presentation/resources/strings_manager.dart';
import 'package:abc/presentation/resources/values_manager.dart';
import 'package:abc/presentation/widgets/custom_button.dart';
import 'package:abc/presentation/widgets/custom_page_transition.dart';
import 'package:flutter/material.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({Key? key}) : super(key: key);

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
      duration: const Duration(milliseconds: DurationConstant.d2000),
      vsync: this)
    ..repeat(reverse: true);
  late final Animation<double> _animation =
      CurvedAnimation(parent: _controller, curve: Curves.ease);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration:
            const BoxDecoration(gradient: ColorManager.primaryGradientColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              flex: 3,
              child: Text(AppStrings.appName.toUpperCase(),
                  style: splashHeadingTextStyle),
            ),
            Flexible(
              flex: 5,
              child: FadeTransition(
                opacity: _animation,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(AppPadding.p18),
                      child: SizedBox(
                        height:
                            MediaQuery.of(context).size.height * AppSize.s0_5,
                        child: Image.asset(ImageAssets.splashLogo),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CustomButton(
              backgroundColor: ColorManager.white,
              foregroundColor: ColorManager.primaryColor,
              onPressed: () => Navigator.push(
                  context,
                  CustomScaleTransition(
                      nextPageUrl: SignInScreen.routeName,
                      nextPage: const SignInScreen())),
              title: AppStrings.getStarted,
            ),
            const SizedBox(
              height: AppSize.s10,
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
