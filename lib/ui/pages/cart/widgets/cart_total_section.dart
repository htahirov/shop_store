import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../cubits/basket/basket_cubit.dart';
import '../../../../cubits/basket/basket_state.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_constants.dart';

class CartTotalSection extends StatelessWidget {
  const CartTotalSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(color: AppColors.platinum),
        SizedBox(height: 20.h),
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
            BlocBuilder<BasketCubit, BasketState>(
              builder: (context, state) {
                if (state is BasketSuccess) {
                  final total = state.items.fold<double>(
                    0,
                    (sum, item) => sum + (item.totalPrice * item.quantity),
                  );
                  return Text(
                    '\$${total.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: AppColors.redmana,
                      fontSize: 14.sp,
                      fontFamily: AppConstants.fontFamilyNunito,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.07,
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ],
    );
  }
}