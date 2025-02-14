import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'favorite_text_styles.dart';

class FavoriteEmptyTexts extends StatelessWidget {
  const FavoriteEmptyTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "No Favorites Found",
          style: FavoriteTextStyles.noFound,
          textAlign: TextAlign.center,
        ),
        30.verticalSpace,
        Text(
          "Open the product menu and select your favorite product",
          textAlign: TextAlign.center,
          style: FavoriteTextStyles.noFoundContent,
        ),
      ],
    );
  }
}
