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

  static final mainTextStyle = TextStyle(
    fontFamily: AppConstants.fontFamilyNunito,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    height: 19.h / 14.sp,
    letterSpacing: -0.5,
    color: AppColors.titleTextColor,
  );

  static final headerTextStyle = TextStyle(
    color: AppColors.titleTextColor,
    fontSize: 26.sp,
    fontFamily: AppConstants.fontFamilyNunito,
    fontWeight: FontWeight.w700,
    height: 35 / 26,
    letterSpacing: -0.13,
  );

  static final h6 = TextStyle(
    fontFamily: AppConstants.fontFamilyInter,
    fontSize: 64.sp,
    color: AppColors.titleTextColor,
    fontWeight: FontWeight.w400,
    height: 77.h / 64.sp,
  );
  static final verifyTextStyle = TextStyle(
    height: 22.h / 14.sp,
    color: AppColors.titleTextColor,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    fontFamily: AppConstants.fontFamilyNunito,
    letterSpacing: -0.5,
  );

  static final cardDescriptionTextStyle = TextStyle(
    fontFamily: AppConstants.fontFamilyNunito,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    height: 19.h / 14.sp,
    letterSpacing: -0.5,
    color: AppColors.titleTextColor,
  );

  static final carouselTextStyle = TextStyle(
    fontFamily: AppConstants.fontFamilyNunito,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.5,
    color: AppColors.white,
  );

  static final navbarButtonTextStyle = TextStyle(
    fontFamily: AppConstants.fontFamilyNunito,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    height: 19.h / 14.sp,
    letterSpacing: -0.5,
    color: AppColors.titleTextColor,
  );

  static final priceDetailsTextStyle = TextStyle(
    fontFamily: AppConstants.fontFamilyNunito,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    height: 19.h / 14.sp,
    letterSpacing: -0.5,
    color: AppColors.titleTextColor,
  );

  static final inputTextStyle = TextStyle(
    height: 22.h / 14.sp,
    color: AppColors.titleTextColor,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    fontFamily: AppConstants.fontFamilyNunito,
    letterSpacing: -0.5,
  );
}
