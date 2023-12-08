import 'package:abc/presentation/resources/color_manager.dart';
import 'package:abc/presentation/resources/strings_manager.dart';
import 'package:abc/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailFormFieldKey = GlobalKey<FormFieldState>();
  String? email;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          emailFormField(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          CustomButton(
            title: AppStrings.kContinue,
            backgroundColor: ColorManager.primaryColor,
            foregroundColor: ColorManager.white,
            width: MediaQuery.of(context).size.width * 0.85,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("${AppStrings.email}: $email")));
              }
            },
          ),
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
        _emailFormFieldKey.currentState!.validate();
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

  @override
  void dispose() {
    super.dispose();
  }
}
