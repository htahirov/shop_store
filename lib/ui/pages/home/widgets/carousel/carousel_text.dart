import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../utils/constants/app_text_styles.dart';
import '../../../../../utils/constants/app_texts.dart';

class CarouselText extends StatelessWidget {
  const CarouselText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 105.h,
          left: 25.w,
          child: Text(
            AppTexts.saleUpTo,
            style: AppTextStyles.carouselTextStyle,
          ),
        ),
        Positioned(
          bottom: 50.h,
          left: 25.w,
          child: Text(
            AppTexts.positioned2,
            style: AppTextStyles.carouselTextStyle.copyWith(
              fontSize: 45.sp,
              height: 61 / 45,
              letterSpacing: 0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Positioned(
          bottom: 35.h,
          left: 90.w,
          child: Text(
            AppTexts.off,
            style: AppTextStyles.carouselTextStyle,
          ),
        ),
      ],
    );
  }
}
