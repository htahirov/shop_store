import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/favorite/favorite_cubit.dart';
import '../../../utils/constants/app_paddings.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_nav_bar.dart';
import 'widgets/favorite_empty.dart';
import 'widgets/favorite_product_card.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Favorite"),
      body: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          if (state is FavoriteSuccess) {
            final favorites = state.favorites;
            if (favorites.isEmpty) {
              return const FavoriteEmpty();
            }
            return Padding(
              padding: AppPaddings.a16,
              child: GridView.builder(
                itemCount: favorites.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  final product = favorites[index];
                  return FavoriteProductCard(product: product);
                },
              ),
            );
          } 
          return const SizedBox.shrink();
        },
      ),
      bottomNavigationBar: const CustomNavbar(),
    );
  }
}
