import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_constants.dart';
import '../../../../utils/constants/app_paddings.dart';
import '../../../../utils/constants/app_radiuses.dart';
import '../../../../utils/constants/app_texts.dart';

class CustomPaymentCard extends StatelessWidget {
  final String cardNumber;
  final String expiryDate;
  final String logoPath;

  const CustomPaymentCard({
    super.key,
    required this.cardNumber,
    required this.expiryDate,
    required this.logoPath,
  });

  String _maskCardNumber(String cardNumber) {
    return '****  ${cardNumber.substring(cardNumber.length - 4)}';
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.darkRift,
        borderRadius: AppRadiuses.a10,
      ),
      child: SizedBox(
        width: 128.w,
        height: 151.h,
        child: Padding(
          padding: AppPaddings.a16,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppTexts.creditCard,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              38.verticalSpace,
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
          ),
        ),
      ),
    );
  }
}
