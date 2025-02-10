import 'package:flutter/material.dart';

import '../../../../../utils/constants/app_paddings.dart';
import 'category_button.dart';

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
            child: CategoryButton(
              text: _categories[index],
              isSelected: _selectedCategoryIndex == index,
              onTap: () {
                setState(() {
                  _selectedCategoryIndex = index;
                });
              },
            ),
          );
        }),
      ),
    );
  }
}
