import 'package:flutter/material.dart';

import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_radiuses.dart';

class CardImage extends StatelessWidget {
  final String imagePath;

  const CardImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: ClipRRect(
        borderRadius: AppRadiuses.a10,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: AppColors.jadePalace,
          ),
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
