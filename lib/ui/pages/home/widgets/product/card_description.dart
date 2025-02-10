import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_text_styles.dart';
import '../../../../widgets/custom_favorite_button.dart';

class CardDescription extends StatelessWidget {
  final String title;
  final double amount;
  final VoidCallback onFavoritePressed;

  const CardDescription({
    super.key,
    required this.title,
    required this.amount,
    required this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppTextStyles.cardDescriptionTextStyle),
            8.verticalSpace,
            Text('$amount \$',
                style: AppTextStyles.cardDescriptionTextStyle.copyWith(
                  color: AppColors.redmana,
                )),
          ],
        ),
        26.verticalSpace,
        const Align(
          alignment: Alignment.center,
          child: CustomFavoriteButton(),
        ),
      ],
    );
  }
}
