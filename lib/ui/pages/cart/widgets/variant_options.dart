import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../data/models/remote/response/basket_item_response.dart';
import '../../../../utils/constants/app_colors.dart';

class VariantOptions extends StatelessWidget {
  final int selectedColorId;
  final int selectedSizeId;
  final List<ColorChoice> colorChoices;
  final List<SizeChoice> sizeChoices;

  const VariantOptions({
    super.key,
    required this.selectedColorId,
    required this.selectedSizeId,
    required this.colorChoices,
    required this.sizeChoices,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Color options
        Row(
          children: colorChoices.map((color) {
            final isSelected = color.id == selectedColorId;
            return Container(
              margin: EdgeInsets.only(right: 10.w),
              width: 24.w,
              height: 24.w,
              decoration: BoxDecoration(
                color: Color(int.parse('0xFF${color.color.substring(1)}')),
                shape: BoxShape.circle,
                border: isSelected 
                    ? Border.all(color: AppColors.jadePalace, width: 2)
                    : null,
              ),
            );
          }).toList(),
        ),
        const Spacer(),
        // Size options
        Row(
          children: sizeChoices.map((size) {
            final isSelected = size.id == selectedSizeId;
            return Container(
              margin: EdgeInsets.only(right: 10.w),
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 6.h,
              ),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.jadePalace : Colors.white,
                borderRadius: BorderRadius.circular(4.r),
                border: Border.all(
                  color: isSelected ? AppColors.jadePalace : AppColors.platinum,
                ),
              ),
              child: Text(
                size.size,
                style: TextStyle(
                  color: isSelected ? Colors.white : AppColors.titleTextColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}