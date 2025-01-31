import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_constants.dart';

class OnboardMainText extends StatelessWidget {
  const OnboardMainText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "Please your eyes on the ",
        style: TextStyle(
          fontFamily: AppConstants.fontFamilyInter,
          fontSize: 64.sp,
          color: AppColors.titleTextColor,
          fontWeight: FontWeight.w400,
          height: 77 / 64,
        ),
        children: <TextSpan>[
          TextSpan(
            text: "trending items",
            style: TextStyle(
              fontFamily: AppConstants.fontFamilyInter,
              fontSize: 64.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.coldLips,
              height: 77 / 64,
            ),
          ),
          TextSpan(
            text: " at Shopy.",
            style: TextStyle(
              fontFamily: AppConstants.fontFamilyInter,
              fontSize: 64.sp,
              color: AppColors.titleTextColor,
              fontWeight: FontWeight.w400,
              height: 77 / 64,
            ),
          ),
        ],
      ),
    );
  }
}
