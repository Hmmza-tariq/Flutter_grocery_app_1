import 'package:abc/presentation/resources/color_manager.dart';
import 'package:abc/presentation/resources/font_manager.dart';
import 'package:abc/presentation/resources/strings_manager.dart';
import 'package:abc/presentation/resources/values_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget locationWidget() {
  return Container(
    padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p20, vertical: AppPadding.p16),
    decoration: const BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s24))),
    child: const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          CupertinoIcons.location,
          color: ColorManager.primaryColor,
          size: AppSize.s24,
        ),
        Text(
          AppStrings.location,
          style: TextStyle(
              color: Colors.black,
              fontSize: FontSize.s16,
              fontWeight: FontWeight.w500),
        ),
        Icon(
          CupertinoIcons.chevron_down,
          color: ColorManager.primaryColor,
          size: AppSize.s24,
        )
      ],
    ),
  );
}
