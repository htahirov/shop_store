import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_constants.dart';
import '../../../../utils/constants/app_paddings.dart';
import '../../../../utils/constants/app_radiuses.dart';

class CategorySelectionRow extends StatefulWidget {
  const CategorySelectionRow({super.key});

  @override
  State<CategorySelectionRow> createState() => _CategorySelectionRowState();
}

class _CategorySelectionRowState extends State<CategorySelectionRow> {
  int? _selectedCategoryIndex;

  final List<String> _categories = ['Recommend', 'Outer', 'Shirt', 'Shoes'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(_categories.length, (index) {
          return Padding(
            padding: AppPaddings.h8,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedCategoryIndex = index;
                });
              },
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: _selectedCategoryIndex == index
                      ? AppColors.jadePalace
                      : null,
                  borderRadius:AppRadiuses.a10,
                  border: Border.all(
                    color: _selectedCategoryIndex == index
                        ? Colors.transparent
                        : AppColors.madeInTheShade,
                    width: 0.5,
                  ),
                ),
                child: Padding(
                  padding: AppPaddings.h24 + AppPaddings.v8,
                  child: Text(
                    _categories[index],
                    style: TextStyle(
                      color: _selectedCategoryIndex == index
                          ? AppColors.darkRift
                          : AppColors.madeInTheShade,
                      fontWeight: FontWeight.w600,
                      fontFamily: AppConstants.fontFamilyNunito,
                      fontSize: 14.sp
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
