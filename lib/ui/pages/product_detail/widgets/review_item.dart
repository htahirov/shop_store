import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_constants.dart';

class ReviewItem extends StatelessWidget {
  final String name;
  final String review;
  final String time;
  final int rating;

  const ReviewItem({
    super.key,
    required this.name,
    required this.review,
    required this.time,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // User Avatar and Name
            CircleAvatar(
              radius: 15.r,
              backgroundColor: AppColors.superSilver,
              child: Text(
                name.isNotEmpty ? name[0].toUpperCase() : 'A',
                style: TextStyle(
                  color: AppColors.titleTextColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(width: 14.w),
            Text(
              name,
              style: TextStyle(
                color: AppColors.titleTextColor,
                fontSize: 14.sp,
                fontFamily: AppConstants.fontFamilyNunito,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.07,
              ),
            ),
            const Spacer(),
            // Star Rating
            Row(
              children: List.generate(
                5,
                (index) => Icon(
                  index < rating ? Icons.star : Icons.star_border,
                  color: AppColors.primary,
                  size: 16.r,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Text(
          review,
          style: TextStyle(
            color: AppColors.titleTextColor,
            fontSize: 14.sp,
            fontFamily: AppConstants.fontFamilyNunito,
            fontWeight: FontWeight.w400,
            height: 1.57,
            letterSpacing: -0.07,
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          time,
          style: TextStyle(
            color: AppColors.platinum,
            fontSize: 9.sp,
            fontFamily: AppConstants.fontFamilyNunito,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.04,
          ),
        ),
      ],
    );
  }
}