import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';
import 'app_constants.dart';

class AppTextStyles {
  AppTextStyles._();

  static const buttonTextStyle = TextStyle(
    color: AppColors.white,
    fontSize: 16,
  );

  static final h6 = TextStyle(
    fontFamily: AppConstants.fontFamilyInter,
    fontSize: 64.sp,
    color: AppColors.titleTextColor,
    fontWeight: FontWeight.w400,
    height: 77.h / 64.sp,
  );
}
