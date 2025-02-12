import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_store/utils/constants/app_constants.dart';
import 'package:shop_store/utils/constants/app_paddings.dart';
import 'package:shop_store/utils/helpers/go.dart';
import 'package:shop_store/utils/helpers/pager.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../cubits/cubit/search_cubit.dart';
import '../../../cubits/cubit/search_state.dart';
import '../../../data/models/remote/response/product_response.dart';
import '../../../utils/constants/app_colors.dart';
import '../home/widgets/product/product_grid.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
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
            height: 37,
            width: 289,
            decoration: BoxDecoration(
              color: AppColors.inputTextColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
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
              onSubmitted: (query) {
                context.read<SearchCubit>().search(query);
              },
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
                    onPressed: () {
                      context.read<SearchCubit>().clearSearches();
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: AppColors.textButtonColor,
                    ),
                  ),
                ],
              ),
            ),
            BlocBuilder<SearchCubit, SearchState>(
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
            ),
            203.verticalSpace,
            BlocBuilder<SearchCubit, SearchState>(
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
            ),
          ],
        ),
      ),
    );
  }
}
