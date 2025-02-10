import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_paddings.dart';
import '../../../../utils/constants/app_radiuses.dart';
import 'filter_text_styles.dart';

class CustomDropButton extends StatelessWidget {
  CustomDropButton({super.key});

  List<String> categories = ["Crop Tops", "T-Shirts", "Jeans", "Dresses"];
  final String _selectedCategory = "Crop Tops";

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: AppRadiuses.c50, 
        border: Border.all(color: AppColors.titaniumWhite), 
      ),
      child: Padding(
        padding: AppPaddings.h12, 
        child: SizedBox(
          height: 37.5, 
          child: DropdownButton(
            isExpanded: true,
            value: _selectedCategory,
            icon: SvgPicture.asset(
              "assets/icons/downIcon.svg",
              width: 6,
              height: 10,
            ),
            style: FilterTextStyles.dropButtonTexts,
            borderRadius: AppRadiuses.a50,
            underline: const SizedBox(), 
            items: categories.map((category) {
              return DropdownMenuItem<String>(
                value: category,
                child: Padding(
                  padding: EdgeInsets.zero, 
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/dress.svg",
                        width: 18,
                        height: 18,
                      ),
                      13.horizontalSpace, 
                      Text(category),
                    ],
                  ),
                ),
              );
            }).toList(),
            onChanged: (value) {},
          ),
        ),
      ),
    );
  }
}
