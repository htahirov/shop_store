import 'package:flutter/material.dart';

import '../../../../../data/models/remote/response/product_response.dart';
import '../../../../../utils/constants/app_paddings.dart';

import 'product_card.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key, required this.products});

  final ProductResponse products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: AppPaddings.a8,
      itemCount: products.results!.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        final product = products.results![index];

        return ProductCard(
          product: product,
          onFavoritePressed: () {},
        );
      },
    );
  }
}
