import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../data/models/remote/response/product_detail_response.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_constants.dart';

class ProductInfo extends StatelessWidget {
  final ProductDetailResponse product;

  const ProductInfo({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.category.name,
                style: TextStyle(
                  color: AppColors.textButtonColor,
                  fontSize: 14.sp,
                  fontFamily: AppConstants.fontFamilyNunito,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.07,
                ),
              ),
              Text(
                product.name,
                style: TextStyle(
                  color: AppColors.titleTextColor,
                  fontSize: 26.sp,
                  fontFamily: AppConstants.fontFamilyNunito,
                  fontWeight: FontWeight.w700,
                  height: 1.35,
                  letterSpacing: -0.13,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        SizedBox(width: 10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 20.h,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) => Icon(
                  index < product.rating ? Icons.star : Icons.star_border,
                  color: AppColors.primary,
                  size: 18.r,
                ),
              ),
            ),
            SizedBox(height: 6.h),
            Text(
              '(${product.reviewsCount} reviews)',
              style: TextStyle(
                color: AppColors.textButtonColor,
                fontSize: 10.sp,
                fontFamily: AppConstants.fontFamilyNunito,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.05,
              ),
            ),
          ],
        ),
      ],
    );
  }
}