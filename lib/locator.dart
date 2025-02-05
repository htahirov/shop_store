import 'package:get_it/get_it.dart';
import 'cubits/forgot_password/forgot_password_cubit.dart';
import 'cubits/new_password/new_password_cubit.dart';
import 'cubits/verify/verify_cubit.dart';

import 'cubits/signin/signin_cubit.dart';
import 'cubits/signup/signup_cubit.dart';
import 'cubits/splash/splash_cubit.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory(() => SplashCubit());
  locator.registerFactory(() => VerifyCubit());
  locator.registerFactory(() => ForgotPasswordCubit());
  locator.registerFactory(() => NewPasswordCubit());
  locator.registerFactory(() => SignInCubit());
  locator.registerFactory(() => SignUpCubit());
}
