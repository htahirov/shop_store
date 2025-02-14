import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_constants.dart';

class SizeSelection extends StatelessWidget {
  final String selectedSize;
  final List<String> sizes;
  final Function(String) onSizeSelected;

  const SizeSelection({
    super.key,
    required this.selectedSize,
    required this.sizes,
    required this.onSizeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: sizes.map((size) {
        final isSelected = size == selectedSize;
        return Padding(
          padding: EdgeInsets.only(right: 15.w),
          child: GestureDetector(
            onTap: () => onSizeSelected(size),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : null,
                border: Border.all(
                  color: isSelected ? AppColors.primary : AppColors.platinum,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 5.h,
                ),
                child: Text(
                  size,
                  style: TextStyle(
                    color: isSelected ? AppColors.white : AppColors.textButtonColor,
                    fontSize: 14.sp,
                    fontFamily: AppConstants.fontFamilyNunito,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.07,
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}