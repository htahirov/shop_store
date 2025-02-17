import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/constants/app_assets.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_paddings.dart';
import '../../../../utils/constants/app_radiuses.dart';
import '../../../../utils/constants/app_text_styles.dart';
import '../../../../utils/constants/app_texts.dart';

class AcceptedPaymentMethod extends StatelessWidget {
  const AcceptedPaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> paymentMethods = [
      AppAssets.visa,
      AppAssets.master,
      AppAssets.amex,
      AppAssets.alipay,
      AppAssets.paypal,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppTexts.weAccept,
          style: AppTextStyles.mainTextStyle,
        ),
        10.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: paymentMethods
              .map((asset) => Padding(
                    padding: AppPaddings.r11,
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        color: AppColors.ghostWhite,
                        borderRadius: AppRadiuses.a10,
                      ),
                      child: ClipRRect(
                        borderRadius: AppRadiuses.a10,
                        child: SvgPicture.asset(
                          asset,
                          width: 50.w,
                          height: 34.h,
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
