import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:shop_store/cubits/home/home_cubit.dart';
import 'package:shop_store/utils/constants/app_colors.dart';
import 'package:shop_store/utils/constants/app_paddings.dart';
import 'package:shop_store/utils/helpers/go.dart';
import 'package:shop_store/utils/helpers/pager.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../cubits/profile/profile_cubit.dart';
import '../../../locator.dart';
import '../../widgets/custom_nav_bar.dart';
import '../../widgets/simple_app_bar.dart';
import 'widgets/carousel/custom_carousel_slider.dart';
import 'widgets/categories/category_selection.dart';
import 'widgets/drawer/menu_screen.dart';
import 'widgets/product/product_grid.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ZoomDrawerController drawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();

    return ZoomDrawer(
      controller: drawerController,
      menuScreen:  BlocProvider(
        create: (_) => locator<ProfileCubit>(),
        child: const MenuScreen(),
      ),
      mainScreen: Scaffold(
        appBar: SimpleAppBar(
          onTapMenu: () => drawerController.toggle?.call(),
          onTap: () => Go.to(context, Pager.search),
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
      ),
      borderRadius: 24.0,
      showShadow: true,
      angle: -10.0,
      slideWidth: MediaQuery.of(context).size.width * 0.65,
    );
  }
}
