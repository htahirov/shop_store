import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../cubits/basket/basket_cubit.dart';
import '../../../../data/models/remote/response/basket_item_response.dart';
import 'cart_item.dart';

class CartItemList extends StatelessWidget {
  final List<BasketItem> items;

  const CartItemList({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      separatorBuilder: (_, __) => SizedBox(height: 30.h),
      itemBuilder: (context, index) {
        final item = items[index];
        return CartItem(
          item: item,
          onQuantityDecrease: () {
            if (item.quantity > 1) {
              context.read<BasketCubit>().updateBasketItemQuantity(
                item.id.toString(),
                item.quantity - 1,
              );
            }
          },
          onQuantityIncrease: () {
            context.read<BasketCubit>().updateBasketItemQuantity(
              item.id.toString(),
              item.quantity + 1,
            );
          },
        );
      },
    );
  }
}