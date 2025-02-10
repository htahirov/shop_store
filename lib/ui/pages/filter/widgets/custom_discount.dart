import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_radiuses.dart';

class CustomDiscount extends StatelessWidget {
  CustomDiscount({super.key});

  final List<String> discounts = ["50% off", "40% off", "30% off", "25% off"];
  final String _selectedDiscount = ""; 

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20.w,
      runSpacing: 20.h,
      alignment: WrapAlignment.start,
      children: discounts.map((discount) {
        bool isSelected = _selectedDiscount == discount;
        return SizedBox(
          height: 38,
          child: ChoiceChip(
            label: Text(
              discount,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: isSelected ? AppColors.darkRift : AppColors.graniteConyon,
              ),
            ),
            showCheckmark: false,
            selected: isSelected,
            onSelected: (selected) {},
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: AppRadiuses.c20,
              side: const BorderSide(
                color: AppColors.titaniumWhite,
                width: 1.5,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
