import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_constants.dart';
import '../../../../../utils/constants/app_paddings.dart';
import '../../../../../utils/constants/app_radiuses.dart';

class CategoryButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: isSelected ? AppColors.jadePalace : null,
          borderRadius: AppRadiuses.a10,
          border: Border.all(
            color: isSelected ? Colors.transparent : AppColors.madeInTheShade,
            width: 0.5,
          ),
        ),
        child: Padding(
          padding: AppPaddings.h24 + AppPaddings.v8,
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? AppColors.darkRift : AppColors.madeInTheShade,
              fontWeight: FontWeight.w600,
              fontFamily: AppConstants.fontFamilyNunito,
              fontSize: 14.sp,
              height: 19 / 14,
              letterSpacing: -0.5,
            ),
          ),
        ),
      ),
    );
  }
}
