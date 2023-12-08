class AppStrings {
  static const String appName = "Eat Green";
  static const String getStarted = "Get Started";
  static const String email = "Email";
  static const String password = "Password";
  static const String confirmPassword = "Confirm Password";
  static const String enterEmail = "Enter your email";
  static const String reEnterEmail = "Re-Enter your email";
  static const String enterPassword = "Enter your password";
  static const String login = "Login";
  static const String signIn = "Sign In";
  static const String signUp = "Sign Up";
  static const String signUpTitle = "Sign With Us";
  static const String forgetPassword = "Forgot Password?";
  static const String forgetPassSub =
      "Please enter your email and we will send\n you a link to reset your password";
  static const String resetPassword = "Reset Password";
  static const String createAccount = "Create an account?";
  static const String createAccountSub =
      "Please enter your details or sign up\n with your social media account";
  static const String welcome = "Welcome\nBack";
  static const String skip = "Skip";
  static const String show = "Show";
  static const String hide = "Hide";
  static const String completeProfile = "Complete Your Profile";
  static const String completeInfo = "Please complete your information";
  static const String kContinue = "Continue";
  static const String kAcceptTerms =
      "By continue you are confirm that you agree\n with our terms and conditions";
  static const String kEmailNullError = "Please Enter your email";
  static const String kInvalidEmailError = "Please Enter a valid email";
  static const String kPasswordNullError = "Please Enter your password";
  static const String kShortPasswordError = "Password is too short";
  static const String kPasswordMatchError = "Passwords don't match";
  static const String kFirstNameNullError = "Please Enter your first name";
  static const String kLastNameNullError = "Please Enter your last name";
  static const String kPhoneNumberNullError = "Please Enter your phone number";
  static const String kValidPhoneNumberError =
      "Please Enter a valid phone number";
  static const String kAddressNullError = "Please Enter your address";
  static const String google = "Google";
  static const String facebook = "Facebook";
  static const String twitter = "Twitter";
  static const String or = "OR";
}

final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z]+\.[a-zA-Z]+");
RegExp phoneNumberValidatorRegExp = RegExp(r"(^(?:[+0]9)?[0-9]{11}$)");