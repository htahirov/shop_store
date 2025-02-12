import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_paddings.dart';

class CustomStarRating extends StatelessWidget {
  final int selectedStar; 
  const CustomStarRating({super.key, this.selectedStar = 5});


  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      spacing: 20.w,
      runSpacing: 10.h,
      children: List.generate(5, (index) {
        int star = index + 1;
        bool isSelected = selectedStar == star;
        return ChoiceChip(
          labelPadding: AppPaddings.zero,
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                "assets/icons/star.svg",
                width: 10,
                height: 10,
                colorFilter: ColorFilter.mode(
                  isSelected ? AppColors.darkRift : AppColors.starColor,
                  BlendMode.srcIn,
                ),
              ),
              3.horizontalSpace,
              Text(
                "$star",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: isSelected ? AppColors.darkRift : AppColors.starColor,
                ),
              ),
            ],
          ),
          selected: isSelected,
          showCheckmark: false,
          onSelected: (selected) {},
          selectedColor: AppColors.waterGreen,
          shape: const CircleBorder(
            side: BorderSide(
              color: AppColors.titaniumWhite,
              width: 1.5
            ),
          ),
        );
      }),
    );
  }
}
