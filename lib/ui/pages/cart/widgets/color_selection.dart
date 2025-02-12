import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants/app_colors.dart';

class ColorSelection extends StatelessWidget {
  final String selectedColor;
  final List<String> colors;
  final Function(String) onColorSelected;

  const ColorSelection({
    super.key,
    required this.selectedColor,
    required this.colors,
    required this.onColorSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: colors.map((color) {
        final isSelected = color == selectedColor;
        return GestureDetector(
          onTap: () => onColorSelected(color),
          child: Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: isSelected
                    ? Border.all(color: AppColors.primary, width: 2)
                    : null,
              ),
              child: Padding(
                padding: isSelected ? EdgeInsets.all(2.r) : EdgeInsets.zero,
                child: CircleAvatar(
                  radius: 14.r,
                  backgroundColor: Color(int.parse('0xFF${color.substring(1)}')),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}