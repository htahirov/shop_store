import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'cubits/basket/basket_cubit.dart';
import 'cubits/forgot_password/forgot_password_cubit.dart';
import 'cubits/home/home_cubit.dart';
import 'cubits/new_password/new_password_cubit.dart';
import 'cubits/product_categories/product_categories_cubit.dart';
import 'cubits/product_detail/product_detail_cubit.dart';
import 'cubits/signin/signin_cubit.dart';
import 'cubits/signup/signup_cubit.dart';
import 'cubits/splash/splash_cubit.dart';
import 'cubits/verify/verify_cubit.dart';
import 'data/i_repo/auth_repo_impl.dart';
import 'data/i_repo/basket_repo_impl.dart';
import 'data/i_repo/product_detail_repo_impl.dart';
import 'data/repo/auth_repo.dart';
import 'data/repo/basket_repo.dart';
import 'data/repo/product_detail_repo.dart';
import 'data/services/remote/auth_service.dart';
import 'data/services/remote/basket_service.dart';
import 'data/services/remote/product_detail_service.dart';
import 'data/i_repo/product_repo_impl.dart';
import 'data/repo/product_repo.dart';
import 'data/services/remote/product_service.dart';

final GetIt locator = GetIt.instance;
final navigatorKey = GlobalKey<NavigatorState>();

BuildContext get appContext => navigatorKey.currentState!.context;

void setupLocator() {
  // Existing services
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => ProductService());

  locator.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(locator()));
  locator.registerLazySingleton<ProductRepo>(() => ProductRepoImpl(locator()));

  // Product detail services
  locator.registerLazySingleton(() => ProductDetailService());
  locator.registerLazySingleton<ProductDetailRepo>(() => ProductDetailRepoImpl(locator()));

  locator.registerLazySingleton(() => BasketService());
locator.registerLazySingleton<BasketRepo>(() => BasketRepoImpl(locator()));

  // Cubits
  locator.registerFactory(() => SplashCubit());
  locator.registerFactory(() => VerifyCubit());
  locator.registerFactory(() => ForgotPasswordCubit());
  locator.registerFactory(() => NewPasswordCubit());
  locator.registerFactory(() => SignInCubit(locator()));
  locator.registerFactory(() => SignUpCubit());
  locator.registerFactory(() => ProductDetailCubit(
    locator<ProductDetailRepo>(),
    locator<BasketRepo>(),
  ));
  locator.registerFactory(() => HomeCubit(locator<ProductRepo>()));
  locator.registerFactory(() => ProductCategoriesCubit(locator<ProductRepo>()));
  locator.registerFactory(() => BasketCubit(locator()));
  locator.registerFactory(() => ProductDetailCubit(
    locator<ProductDetailRepo>(),
    locator<BasketRepo>(),
  ));
}
