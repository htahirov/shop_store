import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../utils/constants/app_assets.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_constants.dart';

class AddressButtonCart extends StatelessWidget {
  final VoidCallback? onTap;

  const AddressButtonCart({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 14.h),
      child: Material(
        color: AppColors.jadePalace,
        borderRadius: BorderRadius.circular(6.r),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(6.r),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 7.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Address',
                  style: TextStyle(
                    color: AppColors.titleTextColor,
                    fontSize: 14.sp,
                    fontFamily: AppConstants.fontFamilyNunito,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.07,
                  ),
                ),
                SizedBox(
                  width: 40.w,
                  height: 30.h,
                  child: SvgPicture.asset(
                    AppAssets.arrowRight,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}