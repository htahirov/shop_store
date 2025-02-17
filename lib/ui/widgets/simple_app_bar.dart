import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/constants/app_assets.dart';
import '../../utils/constants/app_paddings.dart';

class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> actions;
  final void Function()? onTapMenu;

  const SimpleAppBar({
    super.key,
    this.onTapMenu,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.h40,
      child: AppBar(
        leading: Center(
          child: GestureDetector(
            onTap: onTapMenu,
            child: SvgPicture.asset(
              AppAssets.menu,
              height: 20.r,
              width: 20.r,
            ),
          ),
        ),
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
