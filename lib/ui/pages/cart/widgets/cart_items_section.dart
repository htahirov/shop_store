import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../data/models/remote/response/basket_item_response.dart';
import 'cart_item.dart';

class CartItemsSection extends StatelessWidget {
  final List<BasketItem> items;

  const CartItemsSection({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(bottom: 20.h),
        child: CartItem(
          item: items[index],
        ),
      ),
    );
  }
}