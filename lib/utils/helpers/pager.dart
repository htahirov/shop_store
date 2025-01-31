import 'package:flutter/material.dart';

import '../../ui/pages/sign_in/signin_page.dart';
import '../../ui/pages/sign_up/signup_page.dart';
import '../../ui/pages/splash/splash_page.dart';

class Pager {
  Pager._();

  static Widget get splash => const SplashPage();
  static Widget get signUp => const SignUpPage();
  static Widget get signIn => const SignInPage();
}
