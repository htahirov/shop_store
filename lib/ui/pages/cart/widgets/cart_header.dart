import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_constants.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      width: double.infinity,
      child: Center(
        child: Text(
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
      ),
    );
  }
}