import 'package:abc/presentation/resources/routes_manager.dart';
import 'package:abc/presentation/resources/strings_manager.dart';
import 'package:abc/presentation/resources/theme_manager.dart';
import 'package:abc/presentation/splash/splash_screen.dart';
import 'package:flutter/material.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: SplashScreen.routeName,
      title: AppStrings.appName,
      theme: getApplicationTheme(),
    );
  }
}
