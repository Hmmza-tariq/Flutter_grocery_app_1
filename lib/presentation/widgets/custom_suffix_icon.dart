import 'package:abc/presentation/resources/values_manager.dart';
import 'package:abc/utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSuffixIcon extends StatelessWidget {
  final String svgIconPath;
  const CustomSuffixIcon({Key? key, required this.svgIconPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          SizeConfig.getProportionateScreenWidth(AppPadding.p20),
          SizeConfig.getProportionateScreenWidth(AppPadding.p20),
          SizeConfig.getProportionateScreenWidth(AppPadding.p10),
          SizeConfig.getProportionateScreenWidth(AppPadding.p20)),
      child: SvgPicture.asset(
        svgIconPath,
        height: SizeConfig.getProportionateScreenWidth(AppSize.s18),
      ),
    );
  }
}
