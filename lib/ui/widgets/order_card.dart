import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants/app_colors.dart';
import '../../utils/constants/app_text_styles.dart';
import 'custom_nav_bar_button.dart';

class OrderCard extends StatelessWidget {
  final String productName;
  final String quantity;
  final double price;
  final String imageUrl;
  final Color colorHex;
  final VoidCallback onViewOrder;

  const OrderCard({
    super.key,
    required this.productName,
    required this.quantity,
    required this.price,
    required this.imageUrl,
    required this.colorHex,
    required this.onViewOrder,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Image.network(
              imageUrl,
              width: 169.w,
              height: 146.h,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => ColoredBox(
                color: AppColors.ghostWhite,
                child: SizedBox(width: 169.w, height: 146.h),
              ),
            ),
          ),
          SizedBox(width: 15.w),

          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: AppTextStyles.cardDescriptionTextStyle,
                ),
                SizedBox(height: 15.h),
                
                // Quantity and Price
                Row(
                  children: [
                    Text(
                      'x$quantity',
                      style: AppTextStyles.cardDescriptionTextStyle,
                    ),
                    SizedBox(width: 20.w),
                    Text(
                      '\$$price',
                      style: AppTextStyles.cardDescriptionTextStyle.copyWith(
                        color: AppColors.redmana,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),

                // Color Circle
                Container(
                  width: 27.w,
                  height: 27.w,
                  decoration: BoxDecoration(
                    color: colorHex,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.jadePalace,
                      width: 2,
                    ),
                  ),
                ),
                SizedBox(height: 9.h),

                // View Order Button
                SizedBox(
                  width: 160.w,
                  child: CustomNavbarButton(
                    title: 'View Order',
                    onPressed: onViewOrder,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}