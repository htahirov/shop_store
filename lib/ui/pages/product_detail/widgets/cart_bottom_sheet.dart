import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_constants.dart';
import '../../../../cubits/product_detail/product_detail_cubit.dart';
import '../../../../data/models/remote/response/product_detail_response.dart';
import '../../../../utils/screen/snackbars.dart';

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

    return BlocListener<ProductDetailCubit, ProductDetailState>(
      listener: (context, state) {
        if (state is ProductDetailSuccess) {
          // First close the bottom sheet
          Navigator.pop(context);
          // Show success message
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Added to cart successfully'),
              backgroundColor: AppColors.primary,
              duration: Duration(seconds: 2),
            ),
          );
        } else if (state is ProductDetailError) {
          Navigator.pop(context);
          Snackbars.showError(context, message: state.message);
        }
      },
      child: DecoratedBox(
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
            // Handle bar at the top
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
                  _buildSizeSelection(product.size),
                  SizedBox(height: 20.h),
                  _buildColorSelection(product.color),
                  SizedBox(height: 20.h),
                  _buildQuantitySelection(),
                  SizedBox(height: 20.h),
                  const Divider(color: AppColors.platinum),
                  SizedBox(height: 20.h),
                  _buildTotalPayment(),
                  SizedBox(height: 30.h),
                  _buildAddToCartButton(context, product),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSizeSelection(List<ProductSize> sizes) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Size', style: _labelStyle),
        SizedBox(height: 10.h),
        SizedBox(
          height: 40.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: sizes.length,
            itemBuilder: (context, index) {
              final sizeOption = sizes[index];
              final isSelected = selectedSize == sizeOption.size;
              return Padding(
                padding: EdgeInsets.only(right: 15.w),
                child: InkWell(
                  onTap: () => setState(() => selectedSize = sizeOption.size),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.primary : null,
                      border: Border.all(
                        color:
                            isSelected ? AppColors.primary : AppColors.platinum,
                      ),
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 10.h,
                      ),
                      child: Text(
                        sizeOption.size,
                        style: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : AppColors.textButtonColor,
                          fontSize: 14.sp,
                          fontFamily: AppConstants.fontFamilyNunito,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildColorSelection(List<ProductColor> colors) {
    return Row(
      children: [
        Text('Color', style: _labelStyle),
        SizedBox(width: 42.w),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: colors.map((colorOption) {
                final isSelected = selectedColorId == colorOption.id;
                return GestureDetector(
                  onTap: () => setState(() => selectedColorId = colorOption.id),
                  child: Padding(
                    padding: EdgeInsets.only(right: 20.w),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: isSelected
                            ? Border.all(color: AppColors.primary, width: 2)
                            : null,
                      ),
                      child: Padding(
                        padding:
                            isSelected ? EdgeInsets.all(2.r) : EdgeInsets.zero,
                        child: CircleAvatar(
                          radius: 14.r,
                          backgroundColor: Color(int.parse(
                              '0xFF${colorOption.color.substring(1)}')),
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
    );
  }

  Widget _buildQuantitySelection() {
    return Row(
      children: [
        Text('Total', style: _labelStyle),
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
            style: _labelStyle,
          ),
        ),
        _buildQuantityButton(
          icon: Icons.add,
          onTap: () => setState(() => quantity++),
          color: AppColors.coldLips,
        ),
      ],
    );
  }

  Widget _buildQuantityButton({
    required IconData icon,
    required VoidCallback onTap,
    Color? color,
  }) {
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
            color: color == null ? AppColors.textButtonColor : Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildTotalPayment() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Total Payment', style: _labelStyle),
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
    );
  }

  Widget _buildAddToCartButton(
      BuildContext context, ProductDetailResponse product) {
    return BlocBuilder<ProductDetailCubit, ProductDetailState>(
      builder: (context, state) {
        final isLoading = state is ProductDetailLoading;

        return InkWell(
          onTap: isLoading
              ? null
              : () {
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

                  final sizeId =
                      product.size.firstWhere((s) => s.size == selectedSize).id;

                  context.read<ProductDetailCubit>().addToCart(
                        productId: product.id,
                        colorId: selectedColorId!,
                        sizeId: sizeId,
                        quantity: quantity,
                      );
                },
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: SizedBox(
              width: double.infinity,
              height: 60.h,
              child: Center(
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : Text(
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
        );
      },
    );
  }

  TextStyle get _labelStyle => TextStyle(
        color: AppColors.titleTextColor,
        fontSize: 14.sp,
        fontFamily: AppConstants.fontFamilyNunito,
        fontWeight: FontWeight.w600,
      );
}
