import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shop_store/data/i_repo/settings_privacy_policy_repo_impl.dart';

import 'cubits/basket/basket_cubit.dart';
import 'cubits/favorite/favorite_cubit.dart';
import 'cubits/forgot_password/forgot_password_cubit.dart';
import 'cubits/home/home_cubit.dart';
import 'cubits/new_password/new_password_cubit.dart';
import 'cubits/order/order_cubit.dart';
import 'cubits/payment/payment_cubit.dart';
import 'cubits/product_categories/product_categories_cubit.dart';
import 'cubits/product_detail/product_detail_cubit.dart';
import 'cubits/profile/profile_cubit.dart';
import 'cubits/search/search_cubit.dart';
import 'cubits/settings/settings_cubit.dart';
import 'cubits/signin/signin_cubit.dart';
import 'cubits/signup/signup_cubit.dart';
import 'cubits/splash/splash_cubit.dart';
import 'cubits/verify/verify_cubit.dart';
import 'data/i_repo/auth_repo_impl.dart';
import 'data/i_repo/basket_repo_impl.dart';
import 'data/i_repo/favorite_repo_impl.dart';
import 'data/i_repo/order_repo_impl.dart';
import 'data/i_repo/product_detail_repo_impl.dart';
import 'data/i_repo/product_repo_impl.dart';
import 'data/i_repo/signup_repo_impl.dart';
import 'data/repo/auth_repo.dart';
import 'data/repo/basket_repo.dart';
import 'data/repo/favorite_repo.dart';
import 'data/repo/order_repo.dart';
import 'data/repo/product_detail_repo.dart';
import 'data/repo/product_repo.dart';
import 'data/repo/settings_privacy_policy_repo.dart';
import 'data/repo/signup_repo.dart';
import 'data/services/remote/auth_service.dart';
import 'data/services/remote/basket_service.dart';
import 'data/services/remote/favorite_service.dart';
import 'data/services/remote/order_service.dart';
import 'data/services/remote/product_detail_service.dart';
import 'data/services/remote/product_service.dart';
import 'data/services/remote/settings_privacy_policy_service.dart';
import 'data/services/remote/signup_service.dart';

final GetIt locator = GetIt.instance;
final navigatorKey = GlobalKey<NavigatorState>();

BuildContext get appContext => navigatorKey.currentState!.context;

void setupLocator() {
  // Services
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => ProductService());
  locator.registerLazySingleton(() => SignUpService());

  // Repositories
  locator.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(locator()));
  locator.registerLazySingleton<ProductRepo>(() => ProductRepoImpl(locator()));
  locator.registerLazySingleton<SignUpRepo>(() => SignUpRepoImpl(locator()));

  // Services
  locator.registerLazySingleton(() => ProductDetailService());
  locator.registerLazySingleton<ProductDetailRepo>(
      () => ProductDetailRepoImpl(locator()));

  locator.registerLazySingleton(() => BasketService());
  locator.registerLazySingleton<BasketRepo>(() => BasketRepoImpl(locator()));

  // Cubits
  locator.registerFactory(() => ProfileCubit());
  locator.registerFactory(() => SearchCubit());
  locator.registerFactory(() => SplashCubit());
  locator.registerFactory(() => VerifyCubit());
  locator.registerFactory(() => ForgotPasswordCubit());
  locator.registerFactory(() => NewPasswordCubit());
  locator.registerFactory(() => SignInCubit(locator()));
  locator.registerFactory(() => PaymentCubit());
  locator.registerFactory(() => SignUpCubit(locator<SignUpRepo>()));
  locator.registerFactory(() => HomeCubit(locator<ProductRepo>()));
  locator.registerFactory(() => ProductCategoriesCubit(locator<ProductRepo>()));
  locator.registerFactory(() => ProductDetailCubit(
        locator<ProductDetailRepo>(),
        locator<BasketRepo>(),
      ));

  locator.registerLazySingleton(() => FavoriteService());
  locator.registerLazySingleton<FavoriteRepository>(
      () => IFavoriteRepository(locator<FavoriteService>()));
  locator.registerFactory(() => FavoriteCubit(locator<FavoriteRepository>()));

  locator.registerFactory(() => BasketCubit(locator<BasketRepo>()));

  // Order
  locator.registerLazySingleton(() => OrderService());
  locator.registerLazySingleton<OrderRepo>(() => OrderRepoImpl(locator()));
  locator.registerFactory(() => OrderCubit(locator()));

  //Settings
  locator.registerLazySingleton(() => SettingsPrivacyPolicyService());
  locator.registerLazySingleton<SettingsPrivacyPolicyRepo>(
      () => ISettingsPrivacyPolicyRepo(locator()));
  locator.registerFactory(
      () => SettingsCubit(locator<SettingsPrivacyPolicyRepo>()));
}
