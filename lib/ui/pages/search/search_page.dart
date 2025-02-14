import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../cubits/cubit/search_cubit.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_constants.dart';
import '../../../utils/constants/app_paddings.dart';
import '../../../utils/helpers/go.dart';
import '../../../utils/helpers/pager.dart';
import '../../widgets/custom_progress_loading.dart';
import '../home/widgets/product/product_grid.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SearchCubit>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
            "assets/icons/arrow_left.svg",
          ),
          onPressed: () {
            Go.replace(context, Pager.home);
          },
        ),
        title: Padding(
          padding: AppPaddings.h40,
          child: Container(
            height: 37.h,
            width: 289.w,
            decoration: BoxDecoration(
              color: AppColors.inputTextColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              controller: cubit.searchController,
              style: const TextStyle(
                color: AppColors.starBorderColor,
              ),
              decoration: const InputDecoration(
                hintText: "Search Items",
                hintStyle: TextStyle(
                  color: AppColors.starBorderColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: AppConstants.fontFamilyNunito,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.starBorderColor,
                ),
                border: InputBorder.none,
                suffixIcon: Icon(
                  Icons.tune,
                  color: AppColors.primary,
                ),
                contentPadding: AppPaddings.v8,
              ),
              onSubmitted: (query) => cubit.search(query),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: AppPaddings.h40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Recent Searches",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textButtonColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () => cubit.clearSearches(),
                    icon: const Icon(
                      Icons.delete,
                      color: AppColors.textButtonColor,
                    ),
                  ),
                ],
              ),
            ),
            StreamBuilder(
                stream: cubit.searchHistoryController.stream,
                builder: (_, snapshot) {
                  if (!snapshot.hasData) {
                    return const CustomProgressLoading.medium();
                  }
                  final recentSearches = snapshot.data;
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: AppPaddings.h24,
                      child: Wrap(
                        spacing: 8.0,
                        children: (recentSearches ?? []).map(
                          (search) {
                            return GestureDetector(
                              onTap: () {
                                log('Chip clicked');
                                cubit.searchController.text = search;
                                log('SearchController: ${cubit.searchController.text}');
                                cubit.search(cubit.searchController.text);
                              },
                              child: Chip(
                                label: Text(search),
                                deleteIcon: const Icon(Icons.close),
                                onDeleted: () {
                                  // context.read<SearchCubit>().removeSearch(search);
                                },
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  );
                }),

            /* BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchRecentLoaded &&
                    state.recentSearches.isNotEmpty) {
                  return Padding(
                    padding: AppPaddings.h24,
                    child: Wrap(
                      spacing: 8.0,
                      children: state.recentSearches.map(
                        (search) {
                          return Chip(
                            label: Text(search),
                            deleteIcon: const Icon(Icons.close),
                            onDeleted: () {
                              context.read<SearchCubit>().removeSearch(search);
                            },
                          );
                        },
                      ).toList(),
                    ),
                  );
                }
                return const SizedBox();
              },
            ), */
            40.verticalSpace,
            StreamBuilder(
                stream: cubit.productController.stream,
                builder: (_, snapshot) {
                  return Skeletonizer(
                    enableSwitchAnimation: true,
                    enabled: !snapshot.hasData,
                    child: ProductGrid(
                      products: snapshot.data ?? cubit.mockProducts,
                    ),
                  );
                }),

            /* BlocBuilder<SearchCubit, SearchState>(
              builder: (_, state) {
                if (state is SearchError || state is SearchNetworkError) {
                  return Center(
                    child: Text(
                      (state as dynamic).message,
                      style: const TextStyle(color: AppColors.redmana),
                    ),
                  );
                }
                final List<Result> product =
                    state is SearchSuccess ? state.searchResults : [];
                log(product.toString());
                return Skeletonizer(
                  enableSwitchAnimation: true,
                  enabled: state is SearchLoading || state is SearchInitial,
                  child: ProductGrid(products: product),
                );
              },
            ), */
          ],
        ),
      ),
    );
  }
}
