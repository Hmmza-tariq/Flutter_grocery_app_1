import 'package:abc/presentation/resources/assets_manager.dart';
import 'package:abc/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';

import 'social_card.dart';

class SocialMediaBox extends StatelessWidget {
  const SocialMediaBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SocialCard(
              svgIconPath: ImageAssets.google,
            ),
            SocialCard(
              svgIconPath: ImageAssets.facebook,
            ),
            SocialCard(
              svgIconPath: ImageAssets.twitter,
            ),
          ],
        ),
        Text(
          AppStrings.kAcceptTerms,
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
