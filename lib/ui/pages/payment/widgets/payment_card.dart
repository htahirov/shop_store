import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/constants/app_assets.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_constants.dart';
import '../../../../utils/constants/app_paddings.dart';
import '../../../../utils/constants/app_radiuses.dart';
import '../../../../utils/constants/app_text_styles.dart';

class PaymentCard extends StatelessWidget {
  final String cardNumber;
  final String expiryDate;
  final String logoPath;
  final double width;
  final double height;
  final String title;
  final String cardHolderName;
  final bool isCompact;
  final bool isSelected;

  const PaymentCard({
    super.key,
    required this.cardNumber,
    required this.expiryDate,
    required this.logoPath,
    required this.cardHolderName,
    this.isSelected = false,
    this.width = 128,
    this.height = 151,
    this.title = "Credit Card",
    this.isCompact = false,
  });

  const PaymentCard.compact({
    super.key,
    required this.cardNumber,
    required this.expiryDate,
    required this.logoPath,
    this.isSelected = false,
    required this.cardHolderName,
  })  : width = 349,
        height = 109,
        title = "Credit Card",
        isCompact = true;

  String _maskCardNumber(String cardNumber) {
    return '****  ${cardNumber.substring(cardNumber.length - 4)}';
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.darkRift,
        borderRadius: AppRadiuses.a10,
        border: isSelected
            ? Border.all(color: AppColors.madeInTheShade, width: 3) 
            : null,
      ),
      child: SizedBox(
        width: width.w,
        height: height.h,
        child: Padding(
          padding: AppPaddings.a16,
          child: isCompact ? _buildCompactLayout() : _buildDefaultLayout(),
        ),
      ),
    );
  }

  Widget _buildDefaultLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        20.verticalSpace,
        Text(
          _maskCardNumber(cardNumber),
          style: TextStyle(
            color: AppColors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              logoPath,
              height: 15.r,
              width: 15.r,
            ),
            Text(
              expiryDate,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                fontFamily: AppConstants.fontFamilyNunito,
                height: 22 / 16,
                letterSpacing: -0.5,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCompactLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style: AppTextStyles.mainTextStyle
                    .copyWith(color: AppColors.white)),
            Text(_maskCardNumber(cardNumber),
                style: AppTextStyles.mainTextStyle
                    .copyWith(color: AppColors.white)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              cardHolderName,
              style: TextStyle(
                fontFamily: AppConstants.fontFamilyNunito,
                color: AppColors.white,
                fontSize: 26.sp,
                fontWeight: FontWeight.w700,
                height: 35 / 26,
                letterSpacing: -0.5,
              ),
            ),
            Row(
              children: [
                SvgPicture.asset(AppAssets.master),
                15.horizontalSpace,
                Text(
                  expiryDate,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    height: 22 / 14,
                    letterSpacing: -0.5,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
