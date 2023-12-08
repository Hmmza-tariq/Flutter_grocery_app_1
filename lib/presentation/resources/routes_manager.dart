import 'package:abc/presentation/complete_profile/complete_profile.dart';
import 'package:abc/presentation/forget_password/forgot_password_screen.dart';
import 'package:abc/presentation/otp_screen/otp_screen.dart';
import 'package:abc/presentation/sign_in/sign_in_screen.dart';
import 'package:abc/presentation/sign_up/sign_up_screen.dart';
import 'package:abc/presentation/splash/splash_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  // HomeScreen.routeName: (context) => const HomeScreen(),
  // ProfileScreen.routeName: (context) => const ProfileScreen(),
  // ProductDetailsScreen.routeName: (context) => const ProductDetailsScreen(),
  // CartScreen.routeName: (context) => const CartScreen(),
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  CompleteProfileScreen.routeName: (context) => const CompleteProfileScreen(),
  OTPScreen.routeName: (context) => const OTPScreen(),
  // CheckoutScreen.routeName: (context) => const CheckoutScreen(),
  // FavouriteScreen.routeName: (context) => const FavouriteScreen(),
  // OrderScreen.routeName: (context) => const OrderScreen()
};
