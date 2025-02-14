import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_store/cubits/favorite/favorite_cubit.dart';

import '../cubits/product_detail/product_detail_cubit.dart';
import '../locator.dart';
import '../utils/constants/app_colors.dart';
import '../utils/extensions/color_extensions.dart';
import '../utils/helpers/pager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => locator<ProductDetailCubit>()),
        BlocProvider(create: (_) => locator<FavoriteCubit>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(430, 932),
        builder: (_, __) => MaterialApp(
          title: 'ShopStore',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Nunito',
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: AppColors.primary.toMaterialColor,
            ),
            useMaterial3: true,
            scaffoldBackgroundColor: AppColors.white,
          ),
          home: Pager.home,
          navigatorKey: navigatorKey,
        ),
      ),
    );
  }
}