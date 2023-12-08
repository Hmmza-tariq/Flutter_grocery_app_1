import 'package:abc/presentation/resources/color_manager.dart';
import 'package:abc/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class CustomCircle extends StatelessWidget {
  final double width, height;
  final double borderWidth;
  final Color? color;
  final LinearGradient? gradient;
  const CustomCircle(
      {Key? key,
      required this.width,
      required this.height,
      this.color = ColorManager.transparent,
      this.gradient,
      this.borderWidth = AppSize.s6})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
            gradient: gradient,
            border: Border.all(
                color: ColorManager.circleColor, width: borderWidth)));
  }
}
