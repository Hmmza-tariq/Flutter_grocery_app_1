import 'package:abc/data/models/user.dart';
import 'package:abc/database/database_service.dart';
import 'package:abc/presentation/otp_screen/otp_screen.dart';
import 'package:abc/presentation/resources/assets_manager.dart';
import 'package:abc/presentation/resources/color_manager.dart';
import 'package:abc/presentation/resources/strings_manager.dart';
import 'package:abc/presentation/sign_in/components/sign_in_form.dart';
import 'package:abc/presentation/widgets/custom_page_transition.dart';
import 'package:abc/presentation/widgets/custom_suffix_icon.dart';
import 'package:abc/presentation/widgets/default_button.dart';
import 'package:abc/presentation/widgets/form_errors.dart';
import 'package:abc/utilities/size_config.dart';
import 'package:flutter/material.dart';

class CompleteProfileForm extends StatefulWidget {
  final ScreenArgs userData;
  const CompleteProfileForm({Key? key, required this.userData})
      : super(key: key);

  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final SqliteDbHelper _sqliteDbHelper = SqliteDbHelper();
  final _formKey = GlobalKey<FormState>();
  final _firstNameFormFieldKey = GlobalKey<FormFieldState>();
  final _lastNameFormFieldKey = GlobalKey<FormFieldState>();
  final _phoneNumberFormFieldKey = GlobalKey<FormFieldState>();
  final _addressFormFieldKey = GlobalKey<FormFieldState>();
  late FocusNode lastNameNode, phoneNode, addressNode;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? address;
  List<String?> errors = [];

  @override
  void initState() {
    super.initState();
    lastNameNode = FocusNode();
    phoneNode = FocusNode();
    addressNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            firstNameFormField(),
            SizedBox(height: SizeConfig.getProportionateScreenHeight(30)),
            lastNameFormField(),
            SizedBox(height: SizeConfig.getProportionateScreenHeight(30)),
            phoneNumberFormField(),
            SizedBox(height: SizeConfig.getProportionateScreenHeight(30)),
            addressFormField(),
            FormError(errors: errors),
            SizedBox(height: SizeConfig.getProportionateScreenHeight(40)),
            DefaultButton(
              text: "continue",
              backgroundColor: ColorManager.primaryColor,
              forgroundColor: Colors.white,
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  try {
                    bool result = await _sqliteDbHelper.checkEmail(
                        email: widget.userData.email);

                    if (result) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                            "The email is already existed please try with another one"),
                        backgroundColor: Colors.black38,
                      ));
                    } else {
                      User user = User(
                          firstName: firstName!,
                          lastName: lastName!,
                          phoneNumber: phoneNumber!,
                          address: address!,
                          email: widget.userData.email,
                          password: widget.userData.password);
                      await _sqliteDbHelper.insertUser(user);
                      Navigator.push(
                          context,
                          CustomScaleTransition(
                              nextPageUrl: OTPScreen.routeName,
                              nextPage: const OTPScreen()));
                    }
                  } on Exception {}
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  TextFormField addressFormField() {
    return TextFormField(
      key: _addressFormFieldKey,
      onSaved: (newAddress) => address = newAddress,
      onChanged: (newAddress) {
        _addressFormFieldKey.currentState!.validate();
        address = newAddress;
      },
      focusNode: addressNode,
      validator: (newAddress) {
        if (newAddress!.isEmpty) {
          return AppStrings.kAddressNullError;
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Address",
        hintText: "Enter your address",
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        suffixIcon: CustomSuffixIcon(svgIconPath: ImageAssets.location),
      ),
    );
  }

  TextFormField phoneNumberFormField() {
    return TextFormField(
      key: _phoneNumberFormFieldKey,
      keyboardType: TextInputType.phone,
      onFieldSubmitted: (newValue) {
        addressNode.requestFocus();
      },
      focusNode: phoneNode,
      onSaved: (newPhoneNumber) => phoneNumber = newPhoneNumber,
      onChanged: (newPhoneNumber) {
        _phoneNumberFormFieldKey.currentState!.validate();
        phoneNumber = newPhoneNumber;
      },
      validator: (newPhoneNumber) {
        if (newPhoneNumber!.isEmpty) {
          return AppStrings.kPhoneNumberNullError;
        } else if (!phoneNumberValidatorRegExp.hasMatch(newPhoneNumber)) {
          return AppStrings.kValidPhoneNumberError;
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIconPath: ImageAssets.phone),
      ),
    );
  }

  TextFormField firstNameFormField() {
    return TextFormField(
      key: _firstNameFormFieldKey,
      autofocus: true,
      onFieldSubmitted: (value) {
        lastNameNode.requestFocus();
      },
      onSaved: (newFirstName) => firstName = newFirstName,
      onChanged: (newFirstName) {
        _firstNameFormFieldKey.currentState!.validate();
        firstName = newFirstName;
      },
      validator: (newFirstName) {
        if (newFirstName!.isEmpty) {
          return AppStrings.kFirstNameNullError;
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "First Name",
        hintText: "Enter your first name",
        suffixIcon: CustomSuffixIcon(svgIconPath: ImageAssets.user),
      ),
    );
  }

  TextFormField lastNameFormField() {
    return TextFormField(
      key: _lastNameFormFieldKey,
      onFieldSubmitted: (value) {
        phoneNode.requestFocus();
      },
      onSaved: (newLastName) => lastName = newLastName,
      onChanged: (newLastName) {
        _lastNameFormFieldKey.currentState!.validate();
        lastName = newLastName;
      },
      focusNode: lastNameNode,
      validator: (newLastName) {
        if (newLastName!.isEmpty) {
          return AppStrings.kLastNameNullError;
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Last Name",
        hintText: "Enter your last name",
        suffixIcon: CustomSuffixIcon(svgIconPath: "assets/icons/User.svg"),
      ),
    );
  }

  @override
  void dispose() {
    lastNameNode.dispose();
    phoneNode.dispose();
    addressNode.dispose();
    super.dispose();
  }
}
