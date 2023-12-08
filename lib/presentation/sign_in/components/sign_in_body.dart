import 'package:flutter/material.dart';

import 'sign_in_form.dart';
import 'welcome_back.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        top: false,
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [WelcomeBack(), SignInForm()],
          ),
        ));
  }
}
