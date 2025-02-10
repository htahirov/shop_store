import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/constants/app_radiuses.dart';
import 'carousel_image.dart';
import 'carousel_text.dart';

class CarouselItems extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;

  const CarouselItems({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: AppRadiuses.a16,
      child: Stack(
        children: [
          CarouselImage(
            imageUrl: imageUrl,
            width: width.w,
            height: height.h,
          ),
          const CarouselText(),
        ],
      ),
    );
  }
}
