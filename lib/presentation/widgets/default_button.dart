import 'package:abc/presentation/resources/color_manager.dart';
import 'package:abc/utilities/size_config.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double width, height;
  const DefaultButton(
      {Key? key,
      this.text,
      this.onPressed,
      this.backgroundColor = ColorManager.white,
      this.foregroundColor = ColorManager.primaryColor,
      this.width = 300,
      this.height = 60})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        // 300  60
        width: SizeConfig.getProportionateScreenWidth(width),
        height: SizeConfig.getProportionateScreenHeight(height),
        child: TextButton(
          style: TextButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            foregroundColor: Colors.white,
            backgroundColor: backgroundColor,
          ),
          onPressed: onPressed,
          child: Text(
            text!,
            style: TextStyle(
              fontSize: SizeConfig.getProportionateScreenWidth(16),
              color: foregroundColor,
            ),
          ),
        ));
  }
}
