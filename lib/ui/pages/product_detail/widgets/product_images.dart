import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../utils/constants/app_colors.dart';

class ProductImages extends StatelessWidget {
  const ProductImages({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 442.h,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Row(
            children: [
              _buildImage('assets/logo/dress_1.svg'),
              SizedBox(width: 20.w),
              _buildImage('assets/logo/dress_2.svg'),
              SizedBox(width: 20.w),
              _buildImage('assets/logo/Mask_group.svg'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage(String assetPath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: Container(
        height: 442.h,
        width: 349.w,
        color: AppColors.superSilver,
        child: SvgPicture.asset(
          assetPath,
          width: 349.w,
          height: 442.h,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}