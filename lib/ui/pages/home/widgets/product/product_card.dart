import 'package:flutter/material.dart';

import '../../../../../data/models/remote/response/product_response.dart';
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
    return Card(
      elevation: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardImage(imagePath: product.image!.image!),
          CardDescription(
            title: product.name!,
            amount: product.totalPrice!,
            onFavoritePressed: onFavoritePressed,
          ),
        ],
      ),
    );
  }
}