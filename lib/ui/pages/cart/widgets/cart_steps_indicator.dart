import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_constants.dart';

class CartStepsIndicator extends StatelessWidget {
  final String title;

  const CartStepsIndicator({super.key, this.title = ''});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.titleTextColor,
            fontSize: 26.sp,
            fontFamily: AppConstants.fontFamilyNunito,
            fontWeight: FontWeight.w700,
            height: 35 / 26,
            letterSpacing: -0.13,
          ),
        ),
        20.verticalSpace,
        SizedBox(
          width: 110.w,
          height: 18.h,
          child: Stack(
            children: [
              Positioned(
                left: 10.75.w,
                top: 8.h,
                child: _buildLine(),
              ),
              ...List.generate(
                3,
                (index) => Positioned(
                  left: (index * 46).w,
                  top: 0,
                  child: _buildDot(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLine() => DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.platinum,
          borderRadius: BorderRadius.circular(15.35.r),
        ),
        child: SizedBox(
          width: 90.w,
          height: 2.h,
        ),
      );

  Widget _buildDot() => DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.white,
          shape: BoxShape.circle,
          border: Border.all(
            width: 1.5,
            color: AppColors.textButtonColor,
          ),
        ),
        child: SizedBox(
          width: 18.r,
          height: 18.r,
        ),
      );
}
