import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_text_styles.dart';
import '../../../../utils/constants/app_texts.dart';

class PriceDetails extends StatelessWidget {
  const PriceDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppTexts.subTotal,
                style: AppTextStyles.priceDetailsTextStyle.copyWith(
                  color: AppColors.madeInTheShade,
                )),
            Text('\$339', style: AppTextStyles.priceDetailsTextStyle),
          ],
        ),
        10.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppTexts.shipping,
                style: AppTextStyles.priceDetailsTextStyle.copyWith(
                  color: AppColors.madeInTheShade,
                )),
            Text('Free', style: AppTextStyles.priceDetailsTextStyle),
          ],
        ),
        20.verticalSpace,
        const Divider(thickness: 0.5,),
        20.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppTexts.total, style: AppTextStyles.priceDetailsTextStyle),
            Text('\$339',
                style: AppTextStyles.priceDetailsTextStyle
                    .copyWith(color: AppColors.redmana)),
          ],
        ),
      ],
    );
  }
}
