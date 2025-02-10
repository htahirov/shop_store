import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../utils/constants/api_keys.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_radiuses.dart';

class CardImage extends StatelessWidget {
  final String imagePath;

  const CardImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 214.h,
      width: 1.sw,
      child: ClipRRect(
        borderRadius: AppRadiuses.a10,
        child: Skeleton.unite(
          child: ColoredBox(
            color: AppColors.jadePalace,
            child: Image.network(
              '${ApiKeys.baseUrl}/$imagePath',
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
