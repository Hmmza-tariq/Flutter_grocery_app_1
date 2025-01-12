import 'package:abc/database/database_service.dart';
import 'package:abc/presentation/forget_password/forgot_password_screen.dart';
import 'package:abc/presentation/home/home_screen.dart';
import 'package:abc/presentation/resources/assets_manager.dart';
import 'package:abc/presentation/resources/color_manager.dart';
import 'package:abc/presentation/resources/font_manager.dart';
import 'package:abc/presentation/resources/strings_manager.dart';
import 'package:abc/presentation/resources/styles_manager.dart';
import 'package:abc/presentation/resources/values_manager.dart';
import 'package:abc/presentation/sign_up/sign_up_screen.dart';
import 'package:abc/presentation/widgets/custom_button.dart';
import 'package:abc/presentation/widgets/custom_page_transition.dart';
import 'package:abc/presentation/widgets/social_card.dart';
import 'package:abc/utilities/keyboard_util.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  // final SqliteDbHelper _sqliteDbHelper = SqliteDbHelper();
  final _formKey = GlobalKey<FormState>();
  final _emailFormFieldKey = GlobalKey<FormFieldState>();
  final _passwordFormFieldKey = GlobalKey<FormFieldState>();
  String? email, password;
  late FocusNode passwordFocusNode;
  String passwordFieldSuffixText = AppStrings.show;
  bool _obscureText = true;
  @override
  void initState() {
    super.initState();
    passwordFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p30),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(AppStrings.login,
                style: Theme.of(context).textTheme.displayLarge
                // TextStyle(
                //     color: Colors.black,
                //     fontWeight: FontWeight.bold,
                //     fontSize: 20)
                ),
          ),
          Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () => Navigator.push(
                        context,
                        CustomScaleTransition(
                            nextPageUrl: ForgotPasswordScreen.routeName,
                            nextPage: const ForgotPasswordScreen())),
                    child: Text(
                      AppStrings.forgetPassword,
                      style: textStyle.copyWith(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                Text(
                  AppStrings.or,
                  style: textStyle.copyWith(
                      color: ColorManager.grey2, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SocialCard(
                      svgIconPath: ImageAssets.google,
                    ),
                    SocialCard(
                      svgIconPath: ImageAssets.facebook,
                    ),
                    SocialCard(
                      svgIconPath: ImageAssets.twitter,
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                CustomButton(
                  title: AppStrings.login,
                  backgroundColor: ColorManager.primaryColor,
                  foregroundColor: ColorManager.white,
                  width: MediaQuery.of(context).size.width * 0.85,
                  onPressed: () async {
                    //
                    //
                    // Navigator.push(
                    //     context,
                    //     CustomScaleTransition(
                    //         nextPageUrl: HomeScreen.routeName,
                    //         nextPage: const HomeScreen()));
                    //
                    //

                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Check user Identity
                      bool result = await SqliteDbHelper()
                          .checkIdentity(email: email, password: password);
                      if (result) {
                        // ignore: use_build_context_synchronously
                        KeyboardUtil.hideKeyboard(context);
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                            context,
                            CustomScaleTransition(
                                nextPageUrl: HomeScreen.routeName,
                                nextPage: const HomeScreen()));
                      } else {
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Please check your email or password"),
                          backgroundColor: Colors.black38,
                        ));
                      }
                    }
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      CustomScaleTransition(
                          nextPageUrl: SignUpScreen.routeName,
                          nextPage: const SignUpScreen())),
                  child: Text(AppStrings.createAccount,
                      style: textStyle.copyWith(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(top: AppPadding.p60),
              child: InkWell(
                onTap: () => Navigator.push(
                    context,
                    CustomScaleTransition(
                        nextPageUrl: HomeScreen.routeName,
                        nextPage: const HomeScreen())),
                child: Text(
                  AppStrings.skip,
                  style: textStyle.copyWith(
                      fontSize: FontSize.s18,
                      decoration: TextDecoration.underline),
                ),
              ),
            ),
          )
        ],
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
        _emailFormFieldKey.currentState!
            .validate(); // call emailFormField validator
      },
      onFieldSubmitted: (newEmail) {
        passwordFocusNode.requestFocus();
      },
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
          labelText: AppStrings.email, hintText: AppStrings.enterEmail),
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
      onSaved: (newPassword) {
        setState(() {
          password = newPassword;
        });
      },
      onChanged: (newPassword) {
        _passwordFormFieldKey.currentState!.validate();
      },
      keyboardType: TextInputType.visiblePassword,
      obscureText: _obscureText,
      decoration: InputDecoration(
          labelText: AppStrings.password,
          hintText: AppStrings.enterPassword,
          suffixIcon: TextButton(
            child: Text(
              passwordFieldSuffixText,
              style: const TextStyle(color: ColorManager.primaryColor),
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
                passwordFieldSuffixText =
                    (passwordFieldSuffixText == AppStrings.show)
                        ? AppStrings.hide
                        : AppStrings.show;
              });
            },
          )),
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

  @override
  void dispose() {
    passwordFocusNode.dispose();
    super.dispose();
  }
}

class ScreenArgs {
  final String email;
  final String password;
  const ScreenArgs({required this.email, required this.password});
}
