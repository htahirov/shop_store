import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_constants.dart';

class OnboardSecondText extends StatelessWidget {
  const OnboardSecondText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        width: 227.w,
        child: Text(
          "Use the voucher provided to buy a shirt, because there are lots of free vouchers here!",
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 16.sp,
            color: AppColors.titleTextColor,
            fontFamily: AppConstants.fontFamilyInter,
            height: 19.h / 16.sp,
          ),
        ),
      ),
    );
  }
}
