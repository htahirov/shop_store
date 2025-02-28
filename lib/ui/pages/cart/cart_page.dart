import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../cubits/basket/basket_cubit.dart';
import '../../../cubits/basket/basket_state.dart';
import '../../../data/models/remote/response/basket_item_response.dart';
import '../../../utils/constants/app_colors.dart';
import '../../widgets/custom_progress_loading.dart';
import 'widgets/address_button_cart.dart';
import 'widgets/cart_header.dart';
import 'widgets/cart_items_section.dart';
import 'widgets/empty_cart_content.dart';
import 'widgets/promo_code_section.dart';
import 'widgets/total_section.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BasketCubit>();
    return Material(
      type: MaterialType.transparency,
      child: ColoredBox(
        color: AppColors.white,
        child: SafeArea(
          child: BlocBuilder<BasketCubit, BasketState>(
            builder: (context, state) {
              if (state is BasketLoading) {
                return const Center(
                  child: CustomProgressLoading(size: 50),
                );
              }

              if (state is BasketError) {
                return Center(
                  child: Text(
                    state.message,
                    style: TextStyle(
                      color: AppColors.redmana,
                      fontSize: 14.sp,
                    ),
                  ),
                );
              }

              // Handle deleting state - show items with loading indicator
              if (state is BasketItemDeleting) {
                return _buildCartContent(state.items, cubit);
              }

              if (state is BasketSuccess && state.items.isNotEmpty) {
                return _buildCartContent(state.items, cubit);
              }

              return const EmptyCartContent();
            },
          ),
        ),
      ),
    );
  }

  // Extract cart content to a separate method to avoid duplication
  Widget _buildCartContent(List<BasketItem> items, final BasketCubit cubit) {
    return Column(
      children: [
        const CartHeader(),
        Expanded(
          child: Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        CartItemsSection(items: items),
                        SizedBox(height: 20.h),
                        PromoCodeSection(
                          controller: cubit.promoController,
                          onApply: () {
                            // TODO: Implement promo code
                          },
                        ),
                        SizedBox(height: 30.h),
                        TotalSection(items: items),
                        SizedBox(height: 80.h),
                      ]),
                    ),
                  ),
                ],
              ),
              Positioned(
                left: 20.w,
                right: 20.w,
                bottom: 14.h,
                child: AddressButtonCart(
                  onTap: () {
                    // TODO: Navigate to address page
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
