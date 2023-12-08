import 'package:abc/presentation/complete_profile/complete_profile.dart';
import 'package:abc/presentation/resources/color_manager.dart';
import 'package:abc/presentation/resources/strings_manager.dart';
import 'package:abc/presentation/resources/values_manager.dart';
import 'package:abc/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailFormFieldKey = GlobalKey<FormFieldState>();
  final _passwordFormFieldKey = GlobalKey<FormFieldState>();
  final _confirmPasswordFormFieldKey = GlobalKey<FormFieldState>();
  String? email, password, confirmedPassword;
  late FocusNode passwordFocusNode, confirmPasswordFocusNode;
  @override
  void initState() {
    super.initState();
    passwordFocusNode = FocusNode();
    confirmPasswordFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p30, vertical: AppPadding.p10),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            emailFormField(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            passwordFormField(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            confirmPasswordFormField(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            CustomButton(
              title: AppStrings.kContinue,
              backgroundColor: ColorManager.primaryColor,
              foregroundColor: ColorManager.white,
              width: MediaQuery.of(context).size.width * 0.85,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  Navigator.pushNamed(context, CompleteProfileScreen.routeName,
                      arguments:
                          ScreenArgs(email: email!, password: password!));
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  TextFormField emailFormField() {
    return TextFormField(
      key: _emailFormFieldKey,
      onSaved: (newEmail) {
        setState(() {
          email = newEmail;
        });
      },
      onChanged: (newEmail) {
        _emailFormFieldKey.currentState!.validate();
      },
      onFieldSubmitted: (newEmail) {
        passwordFocusNode.requestFocus();
      },
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
          labelText: AppStrings.email,
          hintText: AppStrings.enterEmail,
          suffixIcon: Icon(Icons.email)),
      validator: (newEmail) {
        if (newEmail!.isEmpty) {
          return AppStrings.kEmailNullError;
        } else if (!emailValidatorRegExp.hasMatch(newEmail)) {
          return AppStrings.kInvalidEmailError;
        }
        return null;
      },
    );
  }

  TextFormField passwordFormField() {
    return TextFormField(
      key: _passwordFormFieldKey,
      focusNode: passwordFocusNode,
      onChanged: (newPassword) {
        _passwordFormFieldKey.currentState!.validate();
        password = newPassword;
      },
      onFieldSubmitted: (newPassword) {
        confirmPasswordFocusNode.requestFocus();
      },
      keyboardType: TextInputType.visiblePassword,
      obscureText: false,
      decoration: const InputDecoration(
          labelText: AppStrings.password,
          hintText: AppStrings.enterPassword,
          suffixIcon: Icon(Icons.lock)),
      validator: (newPassword) {
        if (newPassword!.isEmpty) {
          return AppStrings.kPasswordNullError;
        } else if (newPassword.length < 8) {
          return AppStrings.kShortPasswordError;
        }
        return null;
      },
    );
  }

  TextFormField confirmPasswordFormField() {
    return TextFormField(
      key: _confirmPasswordFormFieldKey,
      focusNode: confirmPasswordFocusNode,
      onChanged: (newPassword) {
        _confirmPasswordFormFieldKey.currentState!.validate();
        confirmedPassword = newPassword;
      },
      keyboardType: TextInputType.visiblePassword,
      obscureText: false,
      decoration: const InputDecoration(
          labelText: AppStrings.confirmPassword,
          hintText: AppStrings.reEnterEmail,
          suffixIcon: Icon(Icons.lock)),
      validator: (newPassword) {
        if (newPassword!.isEmpty) {
          return AppStrings.kPasswordNullError;
        } else if (newPassword != password) {
          return AppStrings.kPasswordMatchError;
        }
        return null;
      },
    );
  }

  @override
  void dispose() {
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    super.dispose();
  }
}

class ScreenArgs {
  final String email;
  final String password;
  const ScreenArgs({required this.email, required this.password});
}
