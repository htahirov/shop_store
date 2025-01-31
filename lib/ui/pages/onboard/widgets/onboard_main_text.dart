import 'package:flutter/material.dart';

import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_text_styles.dart';

class OnboardMainText extends StatelessWidget {
  const OnboardMainText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "Please your eyes on the ",
        style: AppTextStyles.h6,
        children: <TextSpan>[
          TextSpan(
            text: "trending items",
            style: AppTextStyles.h6.copyWith(
              color: AppColors.coldLips,
            ),
          ),
          TextSpan(
            text: " at Shopy.",
            style: AppTextStyles.h6,
          ),
        ],
      ),
    );
  }
}
