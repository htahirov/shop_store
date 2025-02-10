import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../data/models/remote/response/product_detail_responce.dart';
import 'product_detail_expandable.dart';
import 'product_images.dart';
import 'product_info.dart';
import 'reviews_list.dart';

class ProductDetailContent extends StatelessWidget {
  final ProductDetailResponse product;
  final bool isDescriptionExpanded;
  final bool isReviewsExpanded;
  final VoidCallback onToggleDescription;
  final VoidCallback onToggleReviews;

  const ProductDetailContent({
    super.key,
    required this.product,
    required this.isDescriptionExpanded,
    required this.isReviewsExpanded,
    required this.onToggleDescription,
    required this.onToggleReviews,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductImages(images: product.images),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductInfo(product: product),
                SizedBox(height: 20.h),
                ExpandableSection(
                  title: 'Description',
                  isExpanded: isDescriptionExpanded,
                  onTap: onToggleDescription,
                  content: Text(
                    product.description,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14.sp,
                      height: 1.5,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                ExpandableSection(
                  title: 'Reviews (${product.reviewsCount})',
                  isExpanded: isReviewsExpanded,
                  onTap: onToggleReviews,
                  content: ReviewsList(
                    reviews: product.reviews,
                    reviewCount: product.reviewsCount,
                  ),
                ),
                SizedBox(height: 100.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}