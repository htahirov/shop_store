import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants/app_colors.dart';
import 'custom_slider_prices.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 0.5,
              activeTrackColor: AppColors.darkRift,
              thumbColor: AppColors.waterGreen,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
              disabledActiveTrackColor: AppColors.darkRift,
              disabledThumbColor: AppColors.waterGreen,
            ),
            child: RangeSlider(
              values: const RangeValues(15, 50),
              min: 15,
              max: 100,
              divisions: 9,
              onChanged: null,
            ),
          ),
        ),
        5.verticalSpace,
        const CustomSliderPrices(),
      ],
    );
  }
}
