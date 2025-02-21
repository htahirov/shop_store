import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/constants/app_colors.dart';

class TrackingDotsConnector extends StatelessWidget {
  final Color color;
  
  const TrackingDotsConnector({
    super.key,
    this.color = AppColors.jadePalace,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 7.w),
      child: Column(
        children: List.generate(
          3,
          (index) => Padding(
            padding: EdgeInsets.symmetric(vertical: 3.h),
            child: Container(
              width: 4.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}