import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_radiuses.dart';

class SkeletonLoader extends StatelessWidget {
  final double height;
  final double width;

  const SkeletonLoader({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.desiredDawn,
      highlightColor: AppColors.desiredDawn,
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.desiredDawn,
          borderRadius: AppRadiuses.a16,
        ),
        height: height,
        width: width,
      ),
    );
  }
}
