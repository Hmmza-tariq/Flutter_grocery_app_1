import 'package:flutter/material.dart';

class ColorManager {
  //Main Colors
  static const Color primaryColor = Color(0xFF008000); // Green
  static const Color lightPrimaryColor = Color(0xFFADFF2F); // GreenYellow
  static const Color secondaryColor = Color(0xFF32CD32); // LimeGreen
  static const Color circleColor = Color(0xFF3CB371); // MediumSeaGreen
  static const Color socialCardBgColor = Color(0xFF8FBC8F); // DarkSeaGreen
  static const Color inActiveIconColor = Color(0xFF2E8B57); // SeaGreen
  static const Color searchFieldTextColor = Color(0xFF006400); // DarkGreen
  //Other Colors
  static Color darkGrey = HexColor.fromHex("#525252");
  static Color grey = HexColor.fromHex("#737477");
  static Color lightGrey = HexColor.fromHex("#9E9E9E");
  static Color grey1 = HexColor.fromHex("#707070");
  static Color grey2 = HexColor.fromHex("#797979");
  static Color error = HexColor.fromHex("#e61f34");
  static const Color transparent = Color.fromARGB(0, 255, 255, 255);
  static const Color black = Color.fromARGB(255, 0, 0, 0);
  static const Color white = Color.fromARGB(255, 255, 255, 255);

  static const primaryGradientColor = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromRGBO(34, 139, 34, 0.88),
      Color.fromRGBO(34, 139, 34, 1)
    ], // ForestGreen
  );

  static const circleGradientColor = LinearGradient(
    begin: Alignment.center,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF7CFC00),
      Color.fromRGBO(34, 139, 34, 1)
    ], // LawnGreen and ForestGreen
  );

  static const Color textColor = Color(0xFF228B22); // ForestGreen

  static const primaryShadow = BoxShadow(
    color: Color(0x19393939),
    blurRadius: 60,
    offset: Offset(0, 30),
  );

  static const drawerShadow = BoxShadow(
    color: Color(0xFF006400), // DarkGreen
    offset: Offset(-28, 35),
    spreadRadius: 5,
    blurRadius: 7,
  );
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString";
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
