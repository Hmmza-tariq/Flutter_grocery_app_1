import 'package:abc/presentation/resources/color_manager.dart';
import 'package:abc/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialCard extends StatelessWidget {
  final String svgIconPath;
  const SocialCard({Key? key, required this.svgIconPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width * 0.1,
      padding: const EdgeInsets.all(AppPadding.p8),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: ColorManager.socialCardBgColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p4),
        child: SvgPicture.asset(svgIconPath),
      ),
    );
  }
}
