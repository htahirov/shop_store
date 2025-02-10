import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_assets.dart';
import '../../../../utils/helpers/go.dart';

class ProductDetailAppBar extends StatelessWidget {
  final VoidCallback onFavoritePressed;

  const ProductDetailAppBar({
    super.key,
    required this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => Go.pop(context),
            child: SvgPicture.asset(
              AppAssets.arrowLeft,
              width: 24.w,
              height: 24.h,
            ),
          ),
          InkWell(
            onTap: onFavoritePressed,
            child: CircleAvatar(
              radius: 17.5.r,
              backgroundColor: AppColors.platinum,
              child: const Icon(
                Icons.favorite_border,
                color: AppColors.darkRift,
              ),
            ),
          ),
        ],
      ),
    );
  }
}