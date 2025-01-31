import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/constants/app_colors.dart';
import '../utils/extensions/color_extensions.dart';
import '../utils/helpers/pager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
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
        home: Pager.signIn,
      ),
    );
  }
}
