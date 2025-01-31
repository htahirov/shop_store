import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_constants.dart';
import '../../../../utils/constants/app_radiuses.dart';

class OnboardElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const OnboardElevatedButton(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        minimumSize: Size(165.w, 65.h),
        shape: const RoundedRectangleBorder(
          borderRadius: AppRadiuses.a16,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 26.sp,
          color: AppColors.darkRift,
          letterSpacing: -0.5,
          fontFamily: AppConstants.fontFamilyNunito,
          height: 35 / 26,
        ),
      ),
    );
  }
}
