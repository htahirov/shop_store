import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'cubits/forgot_password/forgot_password_cubit.dart';
import 'cubits/new_password/new_password_cubit.dart';
import 'cubits/product_detail/product_detail_cubit.dart';
import 'cubits/signin/signin_cubit.dart';
import 'cubits/signup/signup_cubit.dart';
import 'cubits/splash/splash_cubit.dart';
import 'cubits/verify/verify_cubit.dart';
import 'data/i_repo/auth_repo_impl.dart';
import 'data/repo/auth_repo.dart';
import 'data/services/remote/auth_service.dart';

final GetIt locator = GetIt.instance;
final navigatorKey = GlobalKey<NavigatorState>();

BuildContext get appContext => navigatorKey.currentState!.context;

void setupLocator() {
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(locator()));

  locator.registerFactory(() => SplashCubit());
  locator.registerFactory(() => VerifyCubit());
  locator.registerFactory(() => ForgotPasswordCubit());
  locator.registerFactory(() => NewPasswordCubit());
  locator.registerFactory(() => SignInCubit(locator()));
  locator.registerFactory(() => SignUpCubit());
  locator.registerFactory(() => ProductDetailCubit());
}
