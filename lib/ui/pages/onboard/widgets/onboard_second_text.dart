import 'package:flutter/material.dart';

import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_constants.dart';

class OnboardSecondText extends StatelessWidget {
  const OnboardSecondText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Use the voucher provided to buy a shirt, because there are lots of free vouchers here!",
      style: TextStyle(
        fontSize: 16,
        color: AppColors.titleTextColor,
        fontFamily: AppConstants.fontFamilyInter,
        height: 19 / 16,
      ),
    );
  }
}
