import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/constants/app_colors.dart';
import '../../utils/constants/app_radiuses.dart';
import '../../utils/constants/app_text_styles.dart';

class CustomNavbarButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final String? iconPath;
  final bool showIcon;

  const CustomNavbarButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.iconPath,
    this.showIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 33.h,
      width: 349.w,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.jadePalace,
          shape: AppRadiuses.aR6,
        ),
        child: showIcon && iconPath != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.navbarButtonTextStyle,
                  ),
                   8.verticalSpace,
                  SvgPicture.asset(
                    iconPath!,
                    height: 32.r,
                    width: 32.r,
                  ),
                ],
              )
            : Center(
                child: Text(
                  title,
                  style: AppTextStyles.navbarButtonTextStyle,
                ),
              ),
      ),
    );
  }
}
