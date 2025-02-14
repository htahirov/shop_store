import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_store/utils/helpers/pager.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../cubits/home/home_cubit.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_paddings.dart';
import '../../../utils/helpers/go.dart';
import '../../widgets/custom_nav_bar.dart';
import '../../widgets/simple_app_bar.dart';
import 'widgets/carousel/custom_carousel_slider.dart';
import 'widgets/categories/category_selection.dart';
import 'widgets/product/product_grid.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return Scaffold(
      appBar: SimpleAppBar.home(
        onTapMenu: () => Go.to(context, Pager.search),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPaddings.t20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomCarouselSlider(),
              35.verticalSpace,
              const CategorySelectionRow(),
              20.verticalSpace,
              BlocBuilder<HomeCubit, HomeState>(
                builder: (_, state) {
                  if (state is HomeError) {
                    return Center(
                      child: Text(
                        state.message,
                        style: const TextStyle(color: AppColors.redmana),
                      ),
                    );
                  } else if (state is HomeNetworkError) {
                    return Center(
                      child: Text(
                        state.message,
                        style: const TextStyle(color: AppColors.redmana),
                      ),
                    );
                  }
                  final products = state is HomeSuccess
                      ? (state.productResponse.results ?? [])
                      : cubit.products;
                  return Skeletonizer(
                    enableSwitchAnimation: true,
                    enabled: state is HomeLoading || state is HomeInitial,
                    child: ProductGrid(products: products),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomNavbar(),
    );
  }
}
