import 'package:abc/presentation/resources/color_manager.dart';
import 'package:abc/presentation/resources/routes_manager.dart';
import 'package:abc/presentation/resources/strings_manager.dart';
import 'package:abc/presentation/resources/theme_manager.dart';
import 'package:abc/presentation/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  MyApp._internal();
  static MyApp instance = MyApp._internal();
  factory MyApp() => instance;

  int appState = 0;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: ColorManager.primaryColor, // Set status bar color to grey
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: SplashScreen.routeName,
      title: AppStrings.appName,
      theme: getApplicationTheme(),
    );
  }
}
