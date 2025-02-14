import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_constants.dart';

class FavoriteTextStyles {
  FavoriteTextStyles._();

  static final noFound = TextStyle(
    fontFamily: AppConstants.fontFamilyNunito,
    fontSize: 26.sp, 
    fontWeight: FontWeight.w700, 
    color: AppColors.titleTextColor,
    height: 35.h / 26.sp, 
    letterSpacing: -0.5, 
  );

    static final noFoundContent = TextStyle(
    fontFamily: AppConstants.fontFamilyNunito,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600, 
    color: AppColors.titleTextColor,
    height: 19.1.h / 14.sp, 
    letterSpacing: -0.5, 
  );

}
