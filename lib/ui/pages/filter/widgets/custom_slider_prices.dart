import 'package:flutter/material.dart';

import 'filter_text_styles.dart';

class CustomSliderPrices extends StatelessWidget {
  const CustomSliderPrices({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("\$15", style: FilterTextStyles.priceText),
        Text("\$100", style: FilterTextStyles.priceText),
      ],
    );
  }
}
