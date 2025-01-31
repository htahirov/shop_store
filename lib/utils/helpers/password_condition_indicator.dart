import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_constants.dart';
import '../models/password_validation.dart';

class PasswordConditionIndicator extends StatelessWidget {
  const PasswordConditionIndicator({
    super.key,
    required this.conditions,
  });

  final List<PasswordCondition> conditions;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        10.verticalSpace,
        Text(
          'Password must contain:',
          style: TextStyle(
            fontSize: 12.sp,
            color: AppColors.textButtonColor,
            fontFamily: AppConstants.fontFamily,
            fontWeight: FontWeight.w600,
          ),
        ),
        8.verticalSpace,
        ...conditions.map((condition) => Padding(
          padding: EdgeInsets.only(bottom: 4.h),
          child: Row(
            children: [
              Icon(
                condition.isMet ? Icons.check_circle : Icons.circle_outlined,
                size: 16.r,
                color: condition.isMet ? AppColors.primary : AppColors.textButtonColor,
              ),
              8.horizontalSpace,
              Text(
                condition.message,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: condition.isMet 
                    ? AppColors.titleTextColor 
                    : AppColors.textButtonColor,
                  fontFamily: AppConstants.fontFamily,
                  fontWeight: condition.isMet 
                    ? FontWeight.w600 
                    : FontWeight.w400,
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }
}