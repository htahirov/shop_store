import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../data/models/remote/response/product_response.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_text_styles.dart';
import '../../../widgets/custom_favorite_button.dart';

class FavoriteCardDescription extends StatelessWidget {
  final String title;
  final double amount;
  final Result product;
  final VoidCallback onFavoritePressed;

  const FavoriteCardDescription({
    super.key,
    required this.title,
    required this.amount,
    required this.product,
    required this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 39.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.cardDescriptionTextStyle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                1.verticalSpace,
                Text(
                  "\$$amount",
                  style: AppTextStyles.cardDescriptionTextStyle.copyWith(
                    color: AppColors.redmana,
                  ),
                ),
              ],
            ),
          ),
          26.verticalSpace,
          Align(
            alignment: Alignment.center,
            child: CustomFavoriteButton(
              product: product,
              onFavoritePressed: onFavoritePressed,
            ),
          ),
        ],
      ),
    );
  }
}
