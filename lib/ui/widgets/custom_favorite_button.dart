import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/favorite/favorite_cubit.dart';
import '../../data/models/remote/response/product_response.dart';
import '../../utils/constants/app_colors.dart';

class CustomFavoriteButton extends StatelessWidget {
  final Result product;
    final VoidCallback onFavoritePressed;

  const CustomFavoriteButton({super.key, required this.product, required this.onFavoritePressed});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        bool isFavorite = false;

        if (state is FavoriteSuccess) {
          isFavorite = state.favorites.contains(product);
        }

        return DecoratedBox(
          decoration: const BoxDecoration(
            color: AppColors.platinum,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? AppColors.redmana : null,
            ),
            onPressed:  onFavoritePressed,
          ),
        );
      },
    );
  }
}
