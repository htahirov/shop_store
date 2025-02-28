import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../cubits/favorite/favorite_cubit.dart';
import '../../../utils/constants/app_paddings.dart';
import '../../../utils/helpers/go.dart';
import '../../../utils/helpers/pager.dart';
import '../../widgets/custom_app_bar.dart';
import 'widgets/favorite_empty.dart';
import 'widgets/favorite_product_card.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Favorite",
        onLeadingPressed: () => Go.replace(context, Pager.home),
      ),
      body: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          if (state is FavoriteLoading || state is FavoriteInitial) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is FavoriteSuccess) {
            final favorites = state.favorites;
            if (favorites.isEmpty) {
              return const FavoriteEmpty();
            }
            return Padding(
              padding: AppPaddings.a16,
              child: GridView.builder(
                itemCount: favorites.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 11,
                  mainAxisSpacing: 20,
                  childAspectRatio: 263.h / 1.sw,
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
      // bottomNavigationBar: const CustomNavbar(),
    );
  }
}
