import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_constants.dart';

class ProductDetailExpandable extends StatelessWidget {
  final String title;
  final bool isExpanded;
  final VoidCallback onTap;
  final Widget content;

  const ProductDetailExpandable({
    super.key,
    required this.title,
    required this.isExpanded,
    required this.onTap,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: AppColors.titleTextColor,
                  fontSize: 14.sp,
                  fontFamily: AppConstants.fontFamilyNunito,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.07,
                ),
              ),
              Icon(
                isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                size: 24.r,
                color: AppColors.titleTextColor,
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        const Divider(
          height: 1,
          thickness: 1,
          color: AppColors.chefsHat,
        ),
        if (isExpanded) ...[
          SizedBox(height: 20.h),
          content,
        ],
      ],
    );
  }
}