import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_constants.dart';

class PromoCodeSection extends StatelessWidget {
  const PromoCodeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.satinDeepBlack,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        child: Row(
          children: [
            Text(
              'Promo Code',
              style: TextStyle(
                color: AppColors.titaniumWhite,
                fontSize: 14.sp,
                fontFamily: AppConstants.fontFamilyNunito,
                fontWeight: FontWeight.w400,
                height: 1.57,
                letterSpacing: -0.07,
              ),
            ),
            const Spacer(),
            DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                child: Text(
                  'Apply',
                  style: TextStyle(
                    color: AppColors.titleTextColor,
                    fontSize: 14.sp,
                    fontFamily: AppConstants.fontFamilyNunito,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.07,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}