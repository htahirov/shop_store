import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_constants.dart';

class CartBottomSheet extends StatefulWidget {
  const CartBottomSheet({super.key});

  @override
  State<CartBottomSheet> createState() => _CartBottomSheetState();
}

class _CartBottomSheetState extends State<CartBottomSheet> {
  String selectedSize = 'S';
  int selectedColorIndex = 3;
  int quantity = 1;

  final List<Color> colors = [
    AppColors.navalNight,
    AppColors.sea,
    AppColors.fatback,
    AppColors.doctor,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 30,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20.h),
          Container(
            width: 46.w,
            height: 5.h,
            decoration: BoxDecoration(
              color: AppColors.desiredDawn,
              borderRadius: BorderRadius.circular(5.r),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(40.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Size Selection
                Row(
                  children: [
                    Text(
                      'Size',
                      style: TextStyle(
                        color: AppColors.titleTextColor,
                        fontSize: 14.sp,
                        fontFamily: AppConstants.fontFamilyNunito,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 50.w),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: ['S', 'M', 'L', 'XL'].map((size) {
                            final isSelected = selectedSize == size;
                            return Padding(
                              padding: EdgeInsets.only(right: 15.w),
                              child: InkWell(
                                onTap: () => setState(() => selectedSize = size),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: size == 'XL' ? 6.w : 10.w,
                                    vertical: 5.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isSelected ? AppColors.primary : null,
                                    border: Border.all(
                                      color: isSelected ? AppColors.primary : AppColors.platinum,
                                    ),
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                  child: Text(
                                    size,
                                    style: TextStyle(
                                      color: isSelected ? Colors.white : AppColors.textButtonColor,
                                      fontSize: 14.sp,
                                      fontFamily: AppConstants.fontFamilyNunito,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),

                // Color Selection
                Row(
                  children: [
                    Text(
                      'Color',
                      style: TextStyle(
                        color: AppColors.titleTextColor,
                        fontSize: 14.sp,
                        fontFamily: AppConstants.fontFamilyNunito,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 42.w),
                    ...List.generate(colors.length, (index) {
                      final isSelected = selectedColorIndex == index;
                      return GestureDetector(
                        onTap: () => setState(() => selectedColorIndex = index),
                        child: Container(
                          margin: EdgeInsets.only(right: 20.w),
                          width: 28.r,
                          height: 28.r,
                          decoration: BoxDecoration(
                            color: colors[index],
                            shape: BoxShape.circle,
                            border: isSelected
                                ? Border.all(color: AppColors.primary, width: 2)
                                : null,
                          ),
                        ),
                      );
                    }),
                  ],
                ),
                SizedBox(height: 20.h),

                // Quantity Selection
                Row(
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        color: AppColors.titleTextColor,
                        fontSize: 14.sp,
                        fontFamily: AppConstants.fontFamilyNunito,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 44.w),
                    _buildQuantityButton(
                      icon: Icons.remove,
                      onTap: () {
                        if (quantity > 1) {
                          setState(() => quantity--);
                        }
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Text(
                        quantity.toString(),
                        style: TextStyle(
                          color: AppColors.titleTextColor,
                          fontSize: 14.sp,
                          fontFamily: AppConstants.fontFamilyNunito,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    _buildQuantityButton(
                      icon: Icons.add,
                      onTap: () => setState(() => quantity++),
                      color: const Color(0xFF9B99F5),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),

                const Divider(color: AppColors.platinum),
                SizedBox(height: 20.h),

                // Total Payment
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Payment',
                      style: TextStyle(
                        color: AppColors.titleTextColor,
                        fontSize: 14.sp,
                        fontFamily: AppConstants.fontFamilyNunito,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '\$${(quantity * 300).toStringAsFixed(2)}',
                      style: TextStyle(
                        color: AppColors.redmana,
                        fontSize: 14.sp,
                        fontFamily: AppConstants.fontFamilyNunito,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),

                // Add to Cart Button
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: double.infinity,
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Center(
                      child: Text(
                        'Add to Cart',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontFamily: AppConstants.fontFamilyNunito,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityButton({
    required IconData icon,
    required VoidCallback onTap,
    Color? color,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 23.r,
        height: 23.r,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: color == null
              ? Border.all(color: AppColors.platinum, width: 1.5)
              : null,
        ),
        child: Icon(
          icon,
          size: 14.r,
          color: color == null ? AppColors.textButtonColor : Colors.white,
        ),
      ),
    );
  }
}