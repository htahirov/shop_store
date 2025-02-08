import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_constants.dart';
import '../../../../utils/constants/app_texts.dart';

class TermsText extends StatelessWidget {
  const TermsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'By signing up you agree to our\n',
              style: TextStyle(
                fontFamily: AppConstants.fontFamilyNunito,
                color: AppColors.textButtonColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w200,
                letterSpacing: -0.06,
                height: 1.5,
              ),
            ),
            TextSpan(
              text: AppTexts.termsOfService,
              style: TextStyle(
                fontFamily: AppConstants.fontFamilyNunito,
                color: AppColors.textButtonColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.07,
              ),
            ),
          ],
        ),
      ),
    );
  }
}