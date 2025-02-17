import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../data/models/remote/response/basket_item_response.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_constants.dart';

class TotalSection extends StatelessWidget {
  final List<BasketItem> items;

  const TotalSection({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        const Divider(
          height: 1,
          thickness: 1,
          color: AppColors.titaniumWhite,
        ),
        SizedBox(height: 30.h),
        // Total row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total',
              style: TextStyle(
                color: AppColors.titleTextColor,
                fontSize: 14.sp,
                fontFamily: AppConstants.fontFamilyNunito,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.07,
              ),
            ),
            Text(
              '\$${_calculateTotal()}',
              style: TextStyle(
                color: AppColors.redmana,
                fontSize: 14.sp,
                fontFamily: AppConstants.fontFamilyNunito,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.07,
              ),
            ),
          ],
        ),
      ],
    );
  }

  String _calculateTotal() {
    final total = items.fold<double>(
      0,
      (sum, item) => sum + (item.totalPrice * item.quantity),
    );
    return total.toStringAsFixed(2);
  }
}