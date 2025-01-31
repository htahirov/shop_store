import 'package:get_it/get_it.dart';

import 'cubits/splash/splash_cubit.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory(() => SplashCubit());
}
