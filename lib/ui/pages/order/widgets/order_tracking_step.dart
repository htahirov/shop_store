import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_constants.dart';
import '../../../../utils/constants/app_text_styles.dart';

class OrderTrackingStep extends StatelessWidget {
  final String title;
  final String date;
  final bool isActive;
  final bool isLast;
  
  const OrderTrackingStep({
    super.key,
    required this.title,
    required this.date,
    this.isActive = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Circle indicator
        Container(
          width: 18.w,
          height: 18.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: isActive ? AppColors.titleTextColor : AppColors.jadePalace,
              width: 1,
            ),
          ),
        ),
        SizedBox(width: 20.w),
        
        // Content
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppTextStyles.cardDescriptionTextStyle,
              ),
              Text(
                date,
                style: TextStyle(
                  color: AppColors.madeInTheShade,
                  fontSize: 9.sp,
                  fontFamily: AppConstants.fontFamilyNunito,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.04,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}