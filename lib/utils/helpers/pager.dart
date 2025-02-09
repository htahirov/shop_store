import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/product_detail/product_detail_cubit.dart';
import '../../cubits/signin/signin_cubit.dart';
import '../../cubits/signup/signup_cubit.dart';
import '../../cubits/splash/splash_cubit.dart';
import '../../cubits/verify/verify_cubit.dart';
import '../../locator.dart';
import '../../ui/pages/create_new_password/create_new_password_page.dart';
import '../../ui/pages/forgot_password/forgot_password_page.dart';
import '../../ui/pages/home/home_page.dart';
import '../../ui/pages/onboard/onboard_page.dart';
import '../../ui/pages/product_detail/product_detail_page.dart';
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

  static Widget get signUp => BlocProvider<SignUpCubit>(
        create: (_) => locator(),
        child: const SignUpPage(),
      );

  static Widget get signIn => BlocProvider<SignInCubit>(
        create: (_) => locator(),
        child: const SignInPage(),
      );

  static Widget get forgotPassword => const ForgotPasswordPage();

  static Widget get createNewPassword => const CreateNewPasswordPage();

  static Widget get verify => BlocProvider<VerifyCubit>(
        create: (_) => locator()..updateVerificationCode(" "),
        child: const VerifyPage(),
      );

  static Widget get productDetail => BlocProvider(
        create: (_) => locator<ProductDetailCubit>(),
        child: const ProductDetailPage(),
      );

  static Widget get home => const HomePage();
}
