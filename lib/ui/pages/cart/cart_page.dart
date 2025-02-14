import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../cubits/basket/basket_cubit.dart';
import '../../../cubits/basket/basket_state.dart';
import '../../../utils/constants/app_colors.dart';
import '../../widgets/custom_nav_bar.dart';
import 'widgets/cart_steps_indicator.dart';
import 'widgets/cart_item_list.dart';
import 'widgets/promo_code_section.dart';
import 'widgets/cart_total_section.dart';
import 'widgets/address_button.dart';
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    context.read<BasketCubit>().getBasketItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: BlocBuilder<BasketCubit, BasketState>(
          builder: (context, state) {
            if (state is BasketLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is BasketError) {
              return Center(child: Text(state.message));
            }

            if (state is BasketSuccess) {
              final items = state.items;
              
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20.h),
                          const CartStepsIndicator(title: "Cart",),
                          SizedBox(height: 30.h),
                          CartItemList(items: items),
                          SizedBox(height: 30.h),
                          const PromoCodeSection(),
                          SizedBox(height: 30.h),
                          const CartTotalSection(),
                          SizedBox(height: 30.h),
                          const AddressButton(),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
      bottomNavigationBar: const CustomNavbar(),
    );
  }
}