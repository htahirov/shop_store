import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../cubits/favorite/favorite_cubit.dart';
import '../../../../data/models/remote/response/product_response.dart';
import '../../../../utils/helpers/go.dart';
import '../../../../utils/helpers/pager.dart';
import '../../home/widgets/product/card_image.dart';
import 'favorite_card_description.dart';

class FavoriteProductCard extends StatelessWidget {
  final Result product;
  const FavoriteProductCard({super.key, required this.product});

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
            FavoriteCardDescription(
              title: product.name!,
              amount: product.totalPrice!,
              product: product,
              onFavoritePressed: () =>
                  context.read<FavoriteCubit>().toggleFavorite(product),
            ),
          ],
        ),
      ),
    );
  }
}
