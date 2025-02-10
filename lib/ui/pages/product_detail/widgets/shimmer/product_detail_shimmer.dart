import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../utils/constants/app_colors.dart';

class ProductDetailShimmer extends StatelessWidget {
  const ProductDetailShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Shimmer
          Container(
            height: 442.h,
            color: Colors.white,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Category Shimmer
                Container(
                  width: 80.w,
                  height: 14.h,
                  color: Colors.white,
                ),
                SizedBox(height: 8.h),
                
                // Title Shimmer
                Container(
                  width: 200.w,
                  height: 26.h,
                  color: Colors.white,
                ),
                SizedBox(height: 16.h),

                // Rating Shimmer
                Row(
                  children: [
                    Container(
                      width: 100.w,
                      height: 20.h,
                      color: Colors.white,
                    ),
                    const Spacer(),
                    Row(
                      children: List.generate(
                        5,
                        (index) => Padding(
                          padding: EdgeInsets.only(left: 4.w),
                          child: Container(
                            width: 16.w,
                            height: 16.h,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),

                // Description Section Shimmer
                Container(
                  width: double.infinity,
                  height: 1,
                  color: AppColors.chefsHat,
                ),
                SizedBox(height: 16.h),
                Container(
                  width: double.infinity,
                  height: 100.h,
                  color: Colors.white,
                ),
                SizedBox(height: 24.h),

                // Reviews Section Shimmer
                Container(
                  width: double.infinity,
                  height: 1,
                  color: AppColors.chefsHat,
                ),
                SizedBox(height: 16.h),
                ...List.generate(2, (index) => Padding(
                  padding: EdgeInsets.only(bottom: 16.h),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 15.r,
                            backgroundColor: Colors.white,
                          ),
                          SizedBox(width: 14.w),
                          Container(
                            width: 100.w,
                            height: 14.h,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Container(
                        width: double.infinity,
                        height: 60.h,
                        color: Colors.white,
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}