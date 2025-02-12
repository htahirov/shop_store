import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../cubits/product_categories/product_categories_cubit.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_paddings.dart';
import 'category_button.dart';

class CategorySelectionRow extends StatefulWidget {
  const CategorySelectionRow({super.key});

  @override
  State<CategorySelectionRow> createState() => _CategorySelectionRowState();
}

class _CategorySelectionRowState extends State<CategorySelectionRow> {
  int? _selectedCategoryIndex;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductCategoriesCubit>();
    return BlocBuilder<ProductCategoriesCubit, ProductCategoriesState>(
      builder: (context, state) {
        if (state is ProductCategoriesError) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(color: AppColors.redmana),
            ),
          );
        } else if (state is ProductCategoriesNetworkError) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(color: AppColors.redmana),
            ),
          );
        }
        final categories = state is ProductCategoriesSuccess
            ? state.productCategoryResponse
            : cubit.mockCategories;
        return Skeletonizer(
          enableSwitchAnimation: true,
          ignoreContainers: false,
          enabled: state is ProductCategoriesLoading ||
              state is ProductCategoriesInitial,
          child: SizedBox(
            height: 35.h,
            child: ListView.separated(
              padding: AppPaddings.h24,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (_, i) => 20.horizontalSpace,
              itemCount: categories.length,
              itemBuilder: (_, index) {
                return CategoryButton(
                  text: categories[index].name,
                  isSelected: _selectedCategoryIndex == index,
                  onTap: () {
                    setState(() {
                      _selectedCategoryIndex = index;
                    });
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
