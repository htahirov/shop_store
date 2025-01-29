import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_store/utils/constants/app_paddings.dart';

import '../../utils/constants/app_assets.dart';
import '../../utils/constants/app_colors.dart';
import '../../utils/constants/app_constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.leadIcon = AppAssets.arrowLeft,
  });

  final String? title;
  final String? leadIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.h40,
      child: AppBar(
        centerTitle: true,
        leading: leadIcon == null
            ? null
            : Center(
                child: SvgPicture.asset(
                  leadIcon!,
                  height: 32.r,
                  width: 32.r,
                ),
              ),
        title: title == null ? null : Text(title!),
        titleTextStyle: TextStyle(
          color: AppColors.titleTextColor,
          fontWeight: FontWeight.w700,
          fontSize: 26.sp,
          height: 35.h / 26.sp,
          letterSpacing: -0.5,
          fontFamily: AppConstants.fontFamily,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
