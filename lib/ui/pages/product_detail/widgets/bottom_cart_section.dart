import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_constants.dart';
import '../../../../cubits/product_detail/product_detail_cubit.dart';
import '../widgets/cart_bottom_sheet.dart';

class BottomCartSection extends StatelessWidget {
  const BottomCartSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '\$300',
            style: TextStyle(
              color: AppColors.redmana,
              fontSize: 26.sp,
              fontFamily: AppConstants.fontFamilyNunito,
              fontWeight: FontWeight.w700,
              height: 1.35,
              letterSpacing: -0.13,
            ),
          ),
          BlocBuilder<ProductDetailCubit, ProductDetailState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) => const CartBottomSheet(),
                  );
                  context.read<ProductDetailCubit>().addToCart();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.w,
                    vertical: 7.h,
                  ),
                  decoration: ShapeDecoration(
                    color: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.r),
                    ),
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
              );
            },
          ),
        ],
      ),
    );
  }
}