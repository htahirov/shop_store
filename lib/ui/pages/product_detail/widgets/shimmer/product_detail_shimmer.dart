import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../utils/constants/app_colors.dart';

class ProductDetailShimmer extends StatelessWidget {
  const ProductDetailShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Shimmer
            SizedBox(
              height: 442.h,
              width: double.infinity,
              child: const ColoredBox(
                color: Colors.white,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category Shimmer
                  SizedBox(
                    width: 80.w,
                    height: 14.h,
                    child: const ColoredBox(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  
                  // Title Shimmer
                  SizedBox(
                    width: 200.w,
                    height: 26.h,
                    child: const ColoredBox(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16.h),

                  // Rating Shimmer
                  Row(
                    children: [
                      SizedBox(
                        width: 100.w,
                        height: 20.h,
                        child: const ColoredBox(
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: List.generate(
                          5,
                          (index) => Padding(
                            padding: EdgeInsets.only(left: 4.w),
                            child: SizedBox(
                              width: 16.w,
                              height: 16.h,
                              child: const ColoredBox(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),

                  // Description Section Shimmer
                  const Divider(
                    color: AppColors.chefsHat,
                  ),
                  SizedBox(height: 16.h),
                  SizedBox(
                    width: double.infinity,
                    height: 100.h,
                    child: const ColoredBox(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 24.h),

                  // Reviews Section Shimmer
                  const Divider(
                    color: AppColors.chefsHat,
                  ),
                  SizedBox(height: 16.h),
                  ...List.generate(
                    2,
                    (index) => Padding(
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
                              SizedBox(
                                width: 100.w,
                                height: 14.h,
                                child: const ColoredBox(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.h),
                          SizedBox(
                            width: double.infinity,
                            height: 60.h,
                            child: const ColoredBox(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  SizedBox(height: 100.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}