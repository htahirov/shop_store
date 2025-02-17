import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants/app_colors.dart';
import '../../utils/constants/app_radiuses.dart';

class CustomAddButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const CustomAddButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: DecoratedBox(
        decoration:  BoxDecoration(
          color: AppColors.white,
          borderRadius: AppRadiuses.a10,
          border: Border.all(
            color: AppColors.titaniumWhite, 
            width: 2.r,
          ),
        ),
        child: SizedBox(
          width: 70.r,
          height: 70.r,
          child: Center(
            child: Icon(
              Icons.add,
              size: 28.r,
              color: AppColors.madeInTheShade,
            ),
          ),
        ),
      ),
    );
  }
}
