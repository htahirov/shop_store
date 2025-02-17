import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../data/models/remote/response/product_response.dart';
import '../../../../../utils/helpers/go.dart';
import '../../../../../utils/helpers/pager.dart';
import 'card_description.dart';
import 'card_image.dart';

class ProductCard extends StatelessWidget {
  final Result product;
  final VoidCallback onFavoritePressed;

  const ProductCard({
    super.key,
    required this.product,
    required this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Go.to(context, Pager.productDetail(product.slug!)),
      child: Card(
        elevation: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardImage(imagePath: product.image!.image!),
            14.verticalSpace,
            CardDescription(
              title: product.name!,
              amount: product.totalPrice!,
              onFavoritePressed: onFavoritePressed, 
              product: product,
            ),
          ],
        ),
      ),
    );
  }
}
