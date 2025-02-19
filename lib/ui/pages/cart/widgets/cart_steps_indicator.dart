import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants/app_colors.dart';

class CartStepsIndicator extends StatelessWidget {
  final int currentStep;

  const CartStepsIndicator(
    String payment, {
    super.key,
    this.currentStep = 1,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110.w,
      height: 18.h,
      child: Stack(
        children: [
          // Horizontal line
          Positioned(
            left: 10.75.w,
            top: 8.h,
            child: Container(
              width: 90.w,
              height: 2.h,
              decoration: ShapeDecoration(
                color: AppColors.titaniumWhite,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.35.r),
                ),
              ),
            ),
          ),
          // First circle
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 18.w,
              height: 18.h,
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: OvalBorder(
                  side: BorderSide(
                    width: 1.5,
                    color: AppColors.madeInTheShade,
                  ),
                ),
              ),
            ),
          ),
          // Middle circle
          Positioned(
            left: 46.w,
            top: 0,
            child: Container(
              width: 18.w,
              height: 18.h,
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: OvalBorder(
                  side: BorderSide(
                    width: 1.5,
                    color: AppColors.madeInTheShade,
                  ),
                ),
              ),
            ),
          ),
          // Last circle
          Positioned(
            left: 92.w,
            top: 0,
            child: Container(
              width: 18.w,
              height: 18.h,
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: OvalBorder(
                  side: BorderSide(
                    width: 1.5,
                    color: AppColors.madeInTheShade,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
