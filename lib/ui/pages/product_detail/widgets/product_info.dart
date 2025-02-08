import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_constants.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Outher',
              style: TextStyle(
                color: AppColors.textButtonColor,
                fontSize: 14.sp,
                fontFamily: AppConstants.fontFamilyNunito,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.07,
              ),
            ),
            Text(
              'Warm Zipper',
              style: TextStyle(
                color: AppColors.titleTextColor,
                fontSize: 26.sp,
                fontFamily: AppConstants.fontFamilyNunito,
                fontWeight: FontWeight.w700,
                height: 1.35,
                letterSpacing: -0.13,
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: List.generate(
                5,
                (index) => Icon(
                  Icons.star,
                  color: AppColors.primary,
                  size: 18.r,
                ),
              ),
            ),
            SizedBox(height: 6.h),
            Text(
              '(254 reviews)',
              style: TextStyle(
                color: AppColors.textButtonColor,
                fontSize: 10.sp,
                fontFamily: AppConstants.fontFamilyNunito,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.05,
              ),
            ),
          ],
        ),
      ],
    );
  }
}