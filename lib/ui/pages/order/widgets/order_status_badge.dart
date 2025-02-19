import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_text_styles.dart';

class OrderStatusBadge extends StatelessWidget {
  final String status;

  const OrderStatusBadge({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: AppColors.jadePalace,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Text(
        status,
        style: AppTextStyles.mainTextStyle.copyWith(
          color: AppColors.primary,
        ),
      ),
    );
  }
}