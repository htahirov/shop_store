import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_store/cubits/main/main_cubit.dart';
import 'package:shop_store/ui/pages/main/main_page.dart';

import '../../cubits/payment/payment_cubit.dart';
import '../../ui/pages/add_new_card/add_new_card_page.dart';
import '../../ui/pages/favorite/favorite_page.dart';
import '../../ui/pages/payment/payment_page.dart';
import '../../ui/pages/search/search_page.dart';

import 'package:shop_store/cubits/profile/profile_cubit.dart';
import 'package:shop_store/ui/pages/profile/profile_page.dart';

import '../../cubits/basket/basket_cubit.dart';
import '../../cubits/favorite/favorite_cubit.dart';
import '../../cubits/home/home_cubit.dart';
import '../../cubits/order/order_cubit.dart';
import '../../cubits/payment/payment_cubit.dart';
import '../../cubits/product_categories/product_categories_cubit.dart';
import '../../cubits/product_detail/product_detail_cubit.dart';
import '../../cubits/profile/profile_cubit.dart';
import '../../cubits/search/search_cubit.dart';
import '../../cubits/settings/settings_cubit.dart';
import '../../cubits/signin/signin_cubit.dart';
import '../../cubits/signup/signup_cubit.dart';
import '../../cubits/splash/splash_cubit.dart';
import '../../cubits/verify/verify_cubit.dart';
import '../../locator.dart';
import '../../ui/pages/add_new_card/add_new_card_page.dart';
import '../../ui/pages/cart/cart_page.dart';
import '../../ui/pages/create_new_password/create_new_password_page.dart';
import '../../ui/pages/favorite/favorite_page.dart';
import '../../ui/pages/filter/filter_page.dart';
import '../../ui/pages/forgot_password/forgot_password_page.dart';
import '../../ui/pages/home/home_page.dart';
import '../../ui/pages/onboard/onboard_page.dart';
import '../../ui/pages/order/order_detail_page.dart';
import '../../ui/pages/order/order_page.dart';
import '../../ui/pages/order/order_track_page.dart';
import '../../ui/pages/payment/payment_page.dart';
import '../../ui/pages/product_detail/product_detail_page.dart';
import '../../ui/pages/profile/profile_page.dart';
import '../../ui/pages/search/search_page.dart';
import '../../ui/pages/settings/settings_language_page.dart';
import '../../ui/pages/settings/settings_page.dart';
import '../../ui/pages/settings/settings_privacy_policy_page.dart';
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

  static Widget get main => BlocProvider(
  create: (context) {
    final cubit = locator<MainCubit>();
    print("MainCubit initialized: $cubit");
    return cubit;
  },
  child: const MainPage(),
);

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

  static Widget get filter => const FilterPage();

  static Widget get verify => BlocProvider<VerifyCubit>(
        create: (_) => locator()..updateVerificationCode(" "),
        child: const VerifyPage(),
      );

  static Widget productDetail(String slug) {
    return BlocProvider.value(
      value: locator<ProductDetailCubit>(),
      child: ProductDetailPage(slug: slug),
    );
  }

  static Widget get cart => MultiBlocProvider(
        providers: [
          BlocProvider<BasketCubit>(
            create: (_) => locator()..getBasketItems(),
          ),
        ],
        child: const CartPage(),
      );

  static Widget get home => MultiBlocProvider(
        providers: [
          BlocProvider<HomeCubit>(
            create: (_) => locator()..getProducts(),
          ),
          BlocProvider<FavoriteCubit>(
            create: (context) => FavoriteCubit(locator()),
          ),
          BlocProvider<ProductCategoriesCubit>(
            create: (context) => locator()..getProductCategories(),
          ),
        ],
        child: HomePage(),
      );

  static Widget get search => MultiBlocProvider(
        providers: [
          BlocProvider<SearchCubit>(
            create: (_) => locator()
              ..getRecentSearches()
              ..getProducts(),
          ),
          BlocProvider<FavoriteCubit>(
            create: (_) => locator(),
          ),
        ],
        child: const SearchPage(),
      );

  static Widget get payment => BlocProvider(
        create: (context) => PaymentCubit()..getPaymentData(),
        child: const PaymentPage(),
      );
  static Widget get addNewCard => BlocProvider(
        create: (context) => PaymentCubit()..getPaymentData(),
        child: const AddNewCardPage(),
      );

  static Widget get favorite => BlocProvider.value(
        value: locator<FavoriteCubit>()..fetchFavorites(),
        child: const FavoritePage(),
      );

  static Widget get order => MultiBlocProvider(
        providers: [
          BlocProvider<OrderCubit>(
            create: (_) => locator()..getOrders(),
          ),
        ],
        child: const OrderPage(),
      );

  static Widget orderDetail(String code) => BlocProvider.value(
        value: locator<OrderCubit>(),
        child: OrderDetailPage(orderId: code),
      );

  static Widget orderTrack(String code) => BlocProvider.value(
        value: locator<OrderCubit>(),
        child: OrderTrackPage(orderId: code),
      );

  static Widget get profile => BlocProvider<ProfileCubit>(
        create: (_) => locator()..loadUserData(),
        child: const ProfilePage(),
      );

  static Widget get settings => const SettingsPage();

  static Widget get settingsLanguage => const SettingsLanguagePage();

  static Widget get settingsPrivacyPolicy => BlocProvider(
        create: (_) => locator<SettingsCubit>()..fetchPrivacyPolicy(),
        child: const SettingsPrivacyPolicyPage(),
      );
}
