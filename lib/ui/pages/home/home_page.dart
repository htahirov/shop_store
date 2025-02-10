import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../cubits/home/home_cubit.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_paddings.dart';
import '../../widgets/custom_nav_bar.dart';
import '../../widgets/custom_progress_loading.dart';
import '../../widgets/simple_app_bar.dart';
import 'widgets/carousel/custom_carousel_slider.dart';
import 'widgets/categories/category_selection.dart';
import 'widgets/product/product_grid.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar.home(),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPaddings.h40 + AppPaddings.t20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomCarouselSlider(),
              35.verticalSpace,
              const CategorySelectionRow(),
              20.verticalSpace,
              BlocBuilder<HomeCubit, HomeState>(
                builder: (_, state) {
                  if (state is HomeLoading) {
                    return const CustomProgressLoading.medium();
                  } else if (state is HomeSuccess) {
                    return ProductGrid(products: state.productResponse);
                  } else if (state is HomeError) {
                    return Center(
                      child: Text(
                        state.message,
                        style: const TextStyle(color: AppColors.redmana),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
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
