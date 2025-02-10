import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../cubits/product_detail/product_detail_cubit.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_constants.dart';

class CartBottomSheet extends StatefulWidget {
  final double price;
  final double totalPrice;
  final int discountInterest;

  const CartBottomSheet({
    super.key,
    required this.price,
    required this.totalPrice,
    required this.discountInterest,
  });

  @override
  State<CartBottomSheet> createState() => _CartBottomSheetState();
}

class _CartBottomSheetState extends State<CartBottomSheet> {
  String? selectedSize;
  int? selectedColorId;
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductDetailCubit>();
    final product = cubit.productDetail;
    
    if (product == null) return const SizedBox.shrink();

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
                          children: product.size.map((sizeOption) {
                            final isSelected = selectedSize == sizeOption.size;
                            return Padding(
                              padding: EdgeInsets.only(right: 15.w),
                              child: InkWell(
                                onTap: () => setState(() => selectedSize = sizeOption.size),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.w,
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
                                    sizeOption.size,
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
                    ...product.color.map((colorOption) {
                      final isSelected = selectedColorId == colorOption.id;
                      return GestureDetector(
                        onTap: () => setState(() => selectedColorId = colorOption.id),
                        child: Container(
                          margin: EdgeInsets.only(right: 20.w),
                          width: 28.r,
                          height: 28.r,
                          decoration: BoxDecoration(
                            color: Color(int.parse('0xFF${colorOption.color.substring(1)}')),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        if (widget.discountInterest > 0)
                          Text(
                            '\$${(widget.price * quantity).toStringAsFixed(2)}',
                            style: TextStyle(
                              color: AppColors.textButtonColor,
                              fontSize: 12.sp,
                              fontFamily: AppConstants.fontFamilyNunito,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        Text(
                          '\$${(widget.totalPrice * quantity).toStringAsFixed(2)}',
                          style: TextStyle(
                            color: AppColors.redmana,
                            fontSize: 14.sp,
                            fontFamily: AppConstants.fontFamilyNunito,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30.h),

                // Add to Cart Button
                GestureDetector(
                  onTap: () {
                    if (selectedSize == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please select a size')),
                      );
                      return;
                    }
                    if (selectedColorId == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please select a color')),
                      );
                      return;
                    }
                    Navigator.pop(context);
                  },
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