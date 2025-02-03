import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_store/cubits/verify/verify_cubit.dart';
import 'package:shop_store/ui/pages/verify_page/verify_page.dart';

import '../../cubits/signin/signin_cubit.dart';
import '../../cubits/signup/signup_cubit.dart';
import '../../cubits/splash/splash_cubit.dart';
import '../../locator.dart';
import '../../ui/pages/onboard/onboard_page.dart';
import '../../ui/pages/sign_in/signin_page.dart';
import '../../ui/pages/sign_up/signup_page.dart';
import '../../ui/pages/splash/splash_page.dart';

class Pager {
  Pager._();

  static Widget get splash => BlocProvider<SplashCubit>(
        create: (_) => locator()..startApp(),
        child: const SplashPage(),
      );

  static Widget get onboard => const OnboardPage();

  static Widget get signUp => BlocProvider<SignUpCubit>(
        create: (_) => locator(),
        child: const SignUpPage(),
      );

  static Widget get signIn => BlocProvider<SignInCubit>(
        create: (_) => locator(),
        child: const SignInPage(),
      );

  static Widget get verify => BlocProvider<VerifyCubit>(
        create: (_) => locator()..updateVerificationCode(" "),
        child: const VerifyPage(),
      );
}