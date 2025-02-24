
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../cubits/basket/basket_cubit.dart';
import '../../../../cubits/basket/basket_state.dart';
import '../../../../data/models/remote/request/basket_update_request.dart';
import '../../../../data/models/remote/response/basket_item_response.dart';
import '../../../../utils/constants/api_keys.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_constants.dart';

class CartItem extends StatelessWidget {
  final BasketItem item;

  const CartItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasketCubit, BasketState>(
      builder: (context, state) {
        // Check if this specific item is being deleted
        final isDeleting = state is BasketItemDeleting && 
                          state.itemId == item.id.toString();

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.network(
                '${ApiKeys.baseUrl}${item.image.image}',
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
            ),
            SizedBox(width: 15.w),

            // Product Details Column
            Expanded(
              child: SizedBox(
                height: 146.h,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Name
                    Text(
                      item.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.titleTextColor,
                        fontSize: 14.sp,
                        fontFamily: AppConstants.fontFamilyNunito,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.07,
                      ),
                    ),
                    SizedBox(height: 5.h),

                    // Price
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
                    SizedBox(height: 5.h),

                    // Colors Row
                    SizedBox(
                      height: 22.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: item.colorChoices.length,
                        separatorBuilder: (_, __) => SizedBox(width: 8.w),
                        itemBuilder: (_, index) {
                          final color = item.colorChoices[index];
                          final isSelected = color.id == item.productColor.id;
                          return _buildColorItem(context, color, isSelected);
                        },
                      ),
                    ),
                    SizedBox(height: 5.h),

                    // Quantity Row
                    SizedBox(
                      height: 24.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildQuantityControl(context),
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(
                              minWidth: 24.w,
                              minHeight: 24.h,
                            ),
                            onPressed: isDeleting
                                ? null
                                : () => context
                                    .read<BasketCubit>()
                                    .removeFromBasket(item.id.toString()),
                            icon: isDeleting
                                ? SizedBox(
                                    width: 20.r,
                                    height: 20.r,
                                    child: const CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: AppColors.redmana,
                                    ),
                                  )
                                : Icon(
                                    Icons.delete_outline,
                                    color: AppColors.redmana,
                                    size: 20.r,
                                  ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5.h),

                    // Sizes Row
                    SizedBox(
                      height: 26.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: item.sizeChoices.length,
                        separatorBuilder: (_, __) => SizedBox(width: 8.w),
                        itemBuilder: (_, index) {
                          final size = item.sizeChoices[index];
                          final isSelected = size.id == item.productSize.id;
                          return _buildSizeItem(context, size, isSelected);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // Update the color item size
  Widget _buildColorItem(
      BuildContext context, ColorChoice color, bool isSelected) {
    return GestureDetector(
      onTap: () {
        context.read<BasketCubit>().updateBasketItem(
              item.id.toString(),
              BasketUpdateRequest(
                quantity: item.quantity,
                colorId: color.id,
                sizeId: item.productSize.id,
              ),
            );
      },
      child: Container(
        width: 24.w,
        height: 24.w,
        decoration: BoxDecoration(
          color: Color(int.parse('0xFF${color.color.substring(1)}')),
          shape: BoxShape.circle,
          border: isSelected
              ? Border.all(width: 2.w, color: AppColors.jadePalace)
              : null,
        ),
      ),
    );
  }

  // Update the size item dimensions
  Widget _buildSizeItem(
      BuildContext context, SizeChoice size, bool isSelected) {
    return GestureDetector(
      onTap: () {
        context.read<BasketCubit>().updateBasketItem(
              item.id.toString(),
              BasketUpdateRequest(
                quantity: item.quantity,
                colorId: item.productColor.id,
                sizeId: size.id,
              ),
            );
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 8.w,
          vertical: 4.h,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.jadePalace : Colors.white,
          borderRadius: BorderRadius.circular(5.r),
          border: Border.all(
            width: 1,
            color: isSelected ? AppColors.jadePalace : AppColors.titaniumWhite,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          size.size,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.madeInTheShade,
            fontSize: 12.sp,
            fontFamily: AppConstants.fontFamilyNunito,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.07,
          ),
        ),
      ),
    );
  }

  // Update quantity control size with debounce
  Widget _buildQuantityControl(BuildContext context) {
    return SizedBox(
      height: 24.h,
      child: Row(
        children: [
          _buildQuantityButton(
            icon: Icons.remove,
            onTap: () {
              if (item.quantity > 1) {
                context.read<BasketCubit>().updateBasketItemWithDebounce(
                      item.id.toString(),
                      BasketUpdateRequest(
                        quantity: item.quantity - 1,
                        colorId: item.productColor.id,
                        sizeId: item.productSize.id,
                      ),
                    );
              }
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(
              item.quantity.toString(),
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          _buildQuantityButton(
            icon: Icons.add,
            onTap: () {
              context.read<BasketCubit>().updateBasketItemWithDebounce(
                    item.id.toString(),
                    BasketUpdateRequest(
                      quantity: item.quantity + 1,
                      colorId: item.productColor.id,
                      sizeId: item.productSize.id,
                    ),
                  );
            },
            isPlus: true,
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityButton({
    required IconData icon,
    required VoidCallback onTap,
    bool isPlus = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 24.w,
        height: 24.h,
        decoration: BoxDecoration(
          color: isPlus ? AppColors.coldLips : Colors.white,
          shape: BoxShape.circle,
          border: !isPlus
              ? Border.all(width: 1.5, color: const Color(0xFFE4E4E4))
              : null,
        ),
        child: Icon(
          icon,
          size: 12.r,
          color: isPlus ? Colors.white : const Color(0xFF6C6D76),
        ),
      ),
    );
  }
}