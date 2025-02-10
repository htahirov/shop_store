import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_constants.dart';

class FilterTextStyles {
  FilterTextStyles._();

  static final priceText = TextStyle(
    fontFamily: AppConstants.fontFamilyNunito,
    fontSize: 10.74.sp, 
    color: AppColors.titleTextColor,
    fontWeight: FontWeight.w600, 
    height: 14.66.h / 10.74.sp, 
    letterSpacing: -0.5, 
  );

  static final applyButtonText = TextStyle(
    fontFamily: AppConstants.fontFamilyNunito,
    fontSize: 14.sp, 
    fontWeight: FontWeight.w600, 
    height: 19.1.h / 14.sp, 
    letterSpacing: -0.5, 
    color: AppColors.titleTextColor, 
  );

  static final resetButtonText = TextStyle(
    fontFamily: AppConstants.fontFamilyNunito,
    fontSize: 14.sp, 
    fontWeight: FontWeight.w600, 
    height: 19.1.h / 14.sp, 
    letterSpacing: -0.5, 
    color: AppColors.waterGreen, 
  );

    static final filterTitles=TextStyle(
      height: 19.1.h/14.sp,
      color: AppColors.satinDeepBlack,
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      fontFamily: AppConstants.fontFamilyNunito,
      letterSpacing: -0.5,
    );

    static final dropButtonTexts=TextStyle(
      height: 22.h/14.sp,
      color: AppColors.satinDeepBlack,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      fontFamily: AppConstants.fontFamilyNunito,
      letterSpacing: -0.5,
    );
}
