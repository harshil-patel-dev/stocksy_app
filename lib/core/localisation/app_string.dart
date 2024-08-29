class AppStrings {
  static const appName = 'BillMart';
  static const logOut = 'Logout';
  static const myAccount = 'My Account';
  static const changePassword = 'Change Password';

  static const apiErrorMessage = 'Something went wrong';

  static const rupeeSymbol = '\u{20B9}';
  // sign up and sign in page
  static const signUp = 'Sign Up';
  static const indianCountryCode = '+91';
  static const setPassword = 'Set Password';
  static const password = 'Password';
  static const passwordHint = 'Enter Password';
  static const refferalCode = 'Referal Code';
  static const mobileNumber = 'Mobile Number';
  static const getStarted = 'Get Started';
  static const confimCheckBox = 'I do hearby confirm that';
  static const tAndC1 =
      'I override my NDNC registration & authorize BillMart or its representative to contact me through SMS / Call / WhatsApp / Email on provided Mobile Number / Email id.';
  static const tAndC2Understood = 'I have read and understood the';
  static const termsOfUse = "Terms of Use";
  static const privacyPolicy = "Privacy Policy";
  static const tAndC2Aceept = 'and agree to accept and abide the same.';

  static const signIn = 'Sign in';
  static const or = 'Or';
  static const alreadyHaveAnAccount = 'Already have an account?';

  static const signInHeading =
      'Easy access to collateral-free capital for all kind of Businesses';
  static const newToBillMart = 'New to BillMart?';
  static const signInWithOtp = 'Sign In with OTP';
  static const forgotPassword = 'Forgot Password';
  static const enterMobileNo = 'Please enter valid Mobile Number.';

  // onboarding screens - About business screen
  static const business = 'Business';
  static const heading = 'Unlock Working Capital with Bill Discounting';
  static const subheading1 = 'No More Pain for Working Capital.';
  static const subheading2 = 'No More High Interest Cost.';
  static const subheading3 = 'No More Lengthy Processes.';
  static const subheading4 = 'Fuelling the infinite Growth, That\'s it.';

  // otp verification
  static const registration = 'Registration';
  static const otp = 'OTP';
  static const verification = 'Verification';
  static const enterOtp = 'Please enter the 6 digit One Time Password';
  static const sentToNumber = 'sent to your mobile number';
  static const resentToNumber = 'resent to your mobile number';
  static const resendIn = 'Resend in';
  static const resendOtp = 'Re-Send';
  static const change = 'change';
  static const next = 'Next';

  // reset password
  static const createPassword = 'Please create a new password below';
  static const setNewPassword = 'Set New Password';
  static const passwordValidationMsg =
      'Password should contain 1 uppercase and 1 lower case letter, 1 digit, 1 special character & should be min 8 characters long';
}


class AppRegEx {
  static final upperCaseRegEx = RegExp(r'[A-Z]');
  static final digitsRegex = RegExp(r'[0-9]');
  static final lowerCaseRegEx = RegExp(r'[a-z]');
  static final specialCharRegExs = RegExp(r'[#?!@$%^&*-]');
}
