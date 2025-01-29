import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/constants/app_assets.dart';

class CustomFabButton extends StatelessWidget {
  const CustomFabButton({
    super.key,
    required this.onPressed,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.r,
      width: 60.r,
      child: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: onPressed,
        child: SvgPicture.asset(
          AppAssets.arrowRight,
          height: 32.r,
          width: 32.r,
        ),
      ),
    );
  }
}
