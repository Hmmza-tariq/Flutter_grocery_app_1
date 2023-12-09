import 'dart:async';
import 'package:abc/presentation/resources/color_manager.dart';
import 'package:abc/presentation/widgets/no_internet_connection.dart';
import 'package:abc/utilities/size_config.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'components/custom_drawer.dart';
import 'home_content.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late StreamSubscription subscription;
  late bool isDeviceConnected = true;
  bool canPop = false;
  DateTime? lastPressedAt;

  @override
  void initState() {
    checkConnectivity();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return PopScope(
      canPop: canPop,
      onPopInvoked: (pop) {
        if (lastPressedAt == null ||
            DateTime.now().difference(lastPressedAt!) >
                const Duration(seconds: 2)) {
          lastPressedAt = DateTime.now();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text('Press back again to exit'),
            backgroundColor: ColorManager.grey2,
          ));
          setState(() {
            canPop = false;
          });
        } else {
          setState(() {
            SystemNavigator.pop();
          });
        }
      },
      child: Scaffold(
        body: SafeArea(
            child: (isDeviceConnected)
                ? const Stack(children: [
                    CustomDrawer(),
                    HomeContent(),
                  ])
                : const NoInternet()),
      ),
    );
  }

  Future<void> checkConnectivity() async {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      isDeviceConnected = await InternetConnectionChecker().hasConnection;
      setState(() {
        isDeviceConnected = isDeviceConnected;
      });
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
}
