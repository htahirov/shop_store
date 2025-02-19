import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_constants.dart';
import 'cart_steps_indicator.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 40.w,
            vertical: 20.h,
          ),
          child: Column(
            children: [
              Text(
                'Cart',
                style: TextStyle(
                  color: AppColors.titleTextColor,
                  fontSize: 26.sp,
                  fontFamily: AppConstants.fontFamilyNunito,
                  fontWeight: FontWeight.w700,
                  height: 1.35,
                  letterSpacing: -0.13,
                ),
              ),
              SizedBox(height: 20.h),
              const Center(
                child: CartStepsIndicator("payment"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}