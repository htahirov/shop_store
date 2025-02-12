import 'package:flutter/material.dart';

import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_radiuses.dart';
import 'filter_text_styles.dart';

class CustomFilterButtons extends StatelessWidget {
  const CustomFilterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 104,
          height: 38,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                    borderRadius: AppRadiuses.a6,
                    side: BorderSide(color: AppColors.waterGreen)),
              ),
              onPressed: () {},
              child: Text("Reset",
                  style: FilterTextStyles.resetButtonText)),
        ),
        SizedBox(
          width: 104,
          height: 38,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.waterGreen,
                  shape:
                      const RoundedRectangleBorder(borderRadius: AppRadiuses.a6)),
              onPressed: () {},
              child: Text("Apply",
                  style:  FilterTextStyles.applyButtonText)),
        )
      ],
    );
  }
}
