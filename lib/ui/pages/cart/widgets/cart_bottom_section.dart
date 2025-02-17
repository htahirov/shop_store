import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../data/models/remote/response/basket_item_response.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_constants.dart';
import 'promo_code_section.dart';
import 'total_section.dart';
import 'address_button_cart.dart';

class CartBottomSection extends StatelessWidget {
  final List<BasketItem> items;
  final TextEditingController promoController;

  const CartBottomSection({
    super.key,
    required this.items,
    required this.promoController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Promo Code Input
        PromoCodeSection(
          controller: promoController,
          onApply: () {
            // TODO: Implement promo code logic
          },
        ),
        SizedBox(height: 20.h),

        // Total Amount
        TotalSection(items: items),
        SizedBox(height: 20.h),

        // Address Selection
        AddressButtonCart(
          onTap: () {
            // TODO: Navigate to address page
          },
        ),
        SizedBox(height: 20.h),

        // Checkout Button
        InkWell(
          onTap: () {
            // TODO: Handle checkout
          },
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 15.h),
            decoration: BoxDecoration(
              color: AppColors.jadePalace,
              borderRadius: BorderRadius.circular(6.r),
            ),
            alignment: Alignment.center,
            child: Text(
              'Proceed to Checkout',
              style: TextStyle(
                color: AppColors.titleTextColor,
                fontSize: 14.sp,
                fontFamily: AppConstants.fontFamilyNunito,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.07,
              ),
            ),
          ),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}