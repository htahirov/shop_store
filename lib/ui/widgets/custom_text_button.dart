import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants/app_colors.dart';
import '../../utils/constants/app_constants.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    this.onPressed,
    required this.text,
  });

  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
           fontSize: 14.sp,
              color: AppColors.textButtonColor,
              fontWeight: FontWeight.w600,
              fontFamily: AppConstants.fontFamilyNunito,
              height: 19.h / 14.sp,
              letterSpacing: -0.5,
        ),
      ),
    );
  }
}
