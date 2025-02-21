import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants/app_colors.dart';
import '../../utils/constants/app_radiuses.dart';

class CustomFlexibleInput extends StatelessWidget {
  final double width;
  final double height;
  final TextEditingController controller;
  final String? label;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  const CustomFlexibleInput({
    super.key,
    required this.width,
    this.height = 44,
    required this.controller,
    this.label,
    this.keyboardType,
    this.onChanged, 
    this.validator,
  });

  const CustomFlexibleInput.small({
    super.key,
    this.width = 110,
    required this.controller,
    this.label,
    this.keyboardType,
    this.onChanged, 
    this.validator,
  }) : height = 44;

  const CustomFlexibleInput.medium({
    super.key,
    this.width = 165,
    required this.controller,
    this.label,
    this.keyboardType,
    this.onChanged, 
    this.validator,
  }) : height = 44;

  const CustomFlexibleInput.large({
    super.key,
    this.width = 350,
    required this.controller,
    this.label,
    this.keyboardType,
    this.onChanged, 
    this.validator,
  }) : height = 44;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(label!),
          15.verticalSpace,
        ],
        SizedBox(
          width: width.w,
          height: height.h,
          child: TextFormField(
            keyboardType: keyboardType,
            controller: controller,
            onChanged: onChanged,
            validator: validator,
            decoration: const InputDecoration(
              fillColor: AppColors.inputFillColor,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: AppRadiuses.a10,
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
              borderRadius: AppRadiuses.a10,
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: AppRadiuses.a10,
              borderSide: BorderSide.none,
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: AppRadiuses.a10,
              borderSide: BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: AppRadiuses.a10,
              borderSide: BorderSide.none,
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: AppRadiuses.a10,
              borderSide: BorderSide.none,
            ),
            ),
          ),
        ),
      ],
    );
  }
}
