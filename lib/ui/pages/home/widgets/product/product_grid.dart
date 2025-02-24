import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_store/utils/screen/snackbars.dart';

import '../../../../../cubits/favorite/favorite_cubit.dart';
import '../../../../../data/models/remote/response/product_response.dart';
import '../../../../../utils/constants/app_paddings.dart';
import 'product_card.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    super.key,
    required this.products,
  });

  final List<Result> products;

  @override
  Widget build(BuildContext context) {
        return BlocListener<FavoriteCubit, FavoriteState>(
        listenWhen: (previous, current) {
        return previous is! FavoriteSuccess &&
            current is FavoriteSuccess &&
            context.read<FavoriteCubit>().wasFavoriteUpdated;
      },
      listener: (context, state) {
        if (state is FavoriteSuccess) {
          context.read<FavoriteCubit>().wasFavoriteUpdated = true; 
          if (context.mounted) {
            Snackbars.showSuccess(context, message: 'Successfully added to favorites');
          }
        }
      },
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: AppPaddings.h24,
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 11,
          mainAxisSpacing: 20,
          childAspectRatio: 263.h / 1.sw,
        ),
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductCard(
            product: product,
            onFavoritePressed: () =>
                context.read<FavoriteCubit>().toggleFavorite(product),
          );
        },
      ),
    );
  }
}
