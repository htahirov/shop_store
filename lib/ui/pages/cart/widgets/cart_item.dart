import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/models/remote/response/basket_item_response.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_constants.dart';

class CartItem extends StatelessWidget {
  final BasketItem item;
  final VoidCallback onQuantityDecrease;
  final VoidCallback onQuantityIncrease;

  const CartItem({
    super.key,
    required this.item,
    required this.onQuantityDecrease,
    required this.onQuantityIncrease,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildImage(),
        SizedBox(width: 20.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name,
                style: TextStyle(
                  color: AppColors.titleTextColor,
                  fontSize: 14.sp,
                  fontFamily: AppConstants.fontFamilyNunito,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.07,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                '\$${item.totalPrice}',
                style: TextStyle(
                  color: AppColors.redmana,
                  fontSize: 14.sp,
                  fontFamily: AppConstants.fontFamilyNunito,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.07,
                ),
              ),
              SizedBox(height: 10.h),
              _buildQuantityControl(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildImage() => ClipRRect(
    borderRadius: BorderRadius.circular(10.r),
    child: Image.network(
      item.image,
      width: 169.w,
      height: 146.h,
      fit: BoxFit.cover,
      errorBuilder: (_, __, ___) => ColoredBox(
        color: AppColors.ghostWhite,
        child: SizedBox(
          width: 169.w,
          height: 146.h,
        ),
      ),
    ),
  );

  Widget _buildQuantityControl() => Row(
    children: [
      _QuantityButton(
        onTap: onQuantityDecrease,
        icon: Icons.remove,
      ),
      SizedBox(width: 15.w),
      Text(
        item.quantity.toString(),
        style: TextStyle(
          color: AppColors.titleTextColor,
          fontSize: 14.sp,
          fontFamily: AppConstants.fontFamilyNunito,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.07,
        ),
      ),
      SizedBox(width: 15.w),
      _QuantityButton(
        onTap: onQuantityIncrease,
        icon: Icons.add,
        color: AppColors.coldLips,
      ),
    ],
  );
}

class _QuantityButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final Color? color;

  const _QuantityButton({
    required this.onTap,
    required this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: color == null
              ? Border.all(color: AppColors.platinum, width: 1.5)
              : null,
        ),
        child: SizedBox(
          width: 23.1.r,
          height: 23.1.r,
          child: Icon(
            icon,
            size: 14.r,
            color: color == null ? AppColors.textButtonColor : AppColors.white,
          ),
        ),
      ),
    );
  }
}