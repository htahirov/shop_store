import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/constants/app_assets.dart';

class FavoriteEmptyImage extends StatelessWidget {
  const FavoriteEmptyImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppAssets.favoriteEmpty,
      height: 183.h,
      width: 224.w,
      fit: BoxFit.contain,
    );
  }
}
