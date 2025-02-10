import 'package:flutter/material.dart';

import '../../../../../utils/constants/app_colors.dart';

class CarouselImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;

  const CarouselImage({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.darkRift,
            blurRadius: 20,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Image.asset(
        imageUrl,
        fit: BoxFit.cover,
        width: width,
        height: height,
      ),
    );
  }
}
