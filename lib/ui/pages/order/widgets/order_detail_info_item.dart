import 'package:flutter/material.dart';

import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_text_styles.dart';

class OrderDetailInfoItem extends StatelessWidget {
  final String label;
  final String value;
  final TextStyle? valueStyle;

  const OrderDetailInfoItem({
    super.key,
    required this.label,
    required this.value,
    this.valueStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyles.cardDescriptionTextStyle,
        ),
        Text(
          value,
          style: valueStyle ?? AppTextStyles.mainTextStyle.copyWith(
            color: AppColors.madeInTheShade,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
