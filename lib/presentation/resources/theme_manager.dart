import 'package:abc/presentation/resources/color_manager.dart';
import 'package:abc/presentation/resources/font_manager.dart';
import 'package:abc/presentation/resources/styles_manager.dart';
import 'package:abc/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
      primaryColor: ColorManager.primaryColor,
      primaryColorLight: ColorManager.lightPrimaryColor,
      primaryColorDark: ColorManager.secondaryColor,
      disabledColor: ColorManager.grey1,
      splashColor: ColorManager.lightPrimaryColor,
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: ColorManager.grey),

      //Card Theme
      cardTheme: CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.grey,
        elevation: AppSize.s4,
      ),

      //AppBar Theme
      appBarTheme: AppBarTheme(
          color: ColorManager.primaryColor,
          centerTitle: true,
          elevation: AppSize.s4,
          shadowColor: ColorManager.lightPrimaryColor,
          titleTextStyle: getRegularStyle(
              color: ColorManager.white, fontSize: AppSize.s16)),

      //Button Theme
      buttonTheme: ButtonThemeData(
        buttonColor: ColorManager.primaryColor,
        splashColor: ColorManager.lightPrimaryColor,
        shape: const StadiumBorder(),
        disabledColor: ColorManager.grey1,
      ),

      //Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: ColorManager.primaryColor,
          textStyle: getRegularStyle(color: ColorManager.white),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s8)),
        ),
      ),

      //Text theme
      textTheme: TextTheme(
          displayLarge: getSemiBoldStyle(
              color: ColorManager.darkGrey, fontSize: FontSize.s16),
          titleMedium: getMediumStyle(
              color: ColorManager.lightGrey, fontSize: FontSize.s14),
          bodySmall: getRegularStyle(color: ColorManager.grey1),
          bodyLarge: getRegularStyle(color: ColorManager.grey)),

      //Input Decoration theme
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        hintStyle: getRegularStyle(color: ColorManager.grey1),
        labelStyle: getMediumStyle(color: ColorManager.darkGrey),
        errorStyle: getRegularStyle(color: ColorManager.error),
        enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
            borderSide:
                BorderSide(color: ColorManager.grey, width: AppSize.s1_5)),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
            borderSide: BorderSide(
                color: ColorManager.primaryColor, width: AppSize.s1_5)),
        errorBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
            borderSide:
                BorderSide(color: ColorManager.error, width: AppSize.s1_5)),
        focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
            borderSide: BorderSide(
                color: ColorManager.primaryColor, width: AppSize.s1_5)),
      ));
}
