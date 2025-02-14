import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_constants.dart';
import '../../../../cubits/product_detail/product_detail_cubit.dart';
import '../widgets/cart_bottom_sheet.dart';

class BottomCartSection extends StatelessWidget {
  final double price;
  final double totalPrice;
  final int discountInterest;

  const BottomCartSection({
    super.key,
    required this.price,
    required this.totalPrice,
    required this.discountInterest,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 30,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (discountInterest > 0) 
                  Text(
                    '\$$price',
                    style: TextStyle(
                      color: AppColors.textButtonColor,
                      fontSize: 14.sp,
                      fontFamily: AppConstants.fontFamilyNunito,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                Text(
                  '\$$totalPrice',
                  style: TextStyle(
                    color: AppColors.redmana,
                    fontSize: 26.sp,
                    fontFamily: AppConstants.fontFamilyNunito,
                    fontWeight: FontWeight.w700,
                    height: 1.35,
                    letterSpacing: -0.13,
                  ),
                ),
              ],
            ),
            BlocBuilder<ProductDetailCubit, ProductDetailState>(
              builder: (context, state) {
                final cubit = context.read<ProductDetailCubit>();
                return InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) => MultiBlocProvider(
                        providers: [
                          BlocProvider.value(value: cubit),
                        ],
                        child: CartBottomSheet(
                          price: price,
                          totalPrice: totalPrice,
                          discountInterest: discountInterest,
                        ),
                      ),
                    );
                  },
                  child: DecoratedBox(
                    decoration: ShapeDecoration(
                      color: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 25.w,
                        vertical: 7.h,
                      ),
                      child: Text(
                        'Add to Cart',
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
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}