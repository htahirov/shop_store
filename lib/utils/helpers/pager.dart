import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/splash/splash_cubit.dart';
import '../../locator.dart';
import '../../ui/pages/onboard/onboard_page.dart';
import '../../ui/pages/sign_in/signin_page.dart';
import '../../ui/pages/sign_up/signup_page.dart';
import '../../ui/pages/splash/splash_page.dart';
import '../../ui/pages/verify_page/verify_page.dart';

class Pager {
  Pager._();

  static Widget get splash => BlocProvider<SplashCubit>(
        create: (_) => locator()..startApp(),
        child: const SplashPage(),
      );

  static Widget get onboard => const OnboardPage();

  static Widget get signUp => const SignUpPage();

  static Widget get signIn => const SignInPage();

  static Widget get verify => const VerifyPage();
}
