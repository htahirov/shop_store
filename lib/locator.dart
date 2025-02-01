import 'package:get_it/get_it.dart';
import 'package:shop_store/cubits/verify/verify_cubit.dart';

import 'cubits/splash/splash_cubit.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory(() => SplashCubit());
  locator.registerFactory(() => VerifyCubit());

}
