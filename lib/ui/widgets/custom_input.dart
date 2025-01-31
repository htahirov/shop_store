import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants/app_colors.dart';
import '../../utils/constants/app_constants.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    super.key,
    this.title,
    this.controller,
    this.isObsecure = false,
    this.keyboardType,
    this.validator,
    this.onChanged,
  });

  final String? title;
  final TextEditingController? controller;
  final bool isObsecure;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(
            title!,
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.titleTextColor,
              fontWeight: FontWeight.w600,
              fontFamily: AppConstants.fontFamilyNunito,
              height: 19.h / 14.sp,
              letterSpacing: -0.5,
            ),
          ),
        15.verticalSpace,
        TextFormField(
          controller: controller,
          obscureText: isObsecure,
          obscuringCharacter: '⬤',
          keyboardType: keyboardType,
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColors.inputTextColor,
            fontWeight: FontWeight.w400,
            fontFamily: AppConstants.fontFamilyNunito,
            height: 22.h / 14.sp,
            letterSpacing: isObsecure ? 10 : -0.5,
          ),
          validator: validator,
          onChanged: onChanged,
          decoration: InputDecoration(
            fillColor: AppColors.inputFillColor,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
