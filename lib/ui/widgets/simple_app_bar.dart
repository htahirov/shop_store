import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/constants/app_assets.dart';
import '../../utils/constants/app_paddings.dart';

class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final void Function()? onTapMenu;
  final void Function()? onTap;

  // SimpleAppBar.product({super.key})
  //     : actions = [
  //         const CustomFavoriteButton(),
  //       ];
  // SimpleAppBar.product({super.key, this.onTapMenu})
  //     : actions = [
  //         const CustomFavoriteButton(),
  //       ];

  const SimpleAppBar({
    super.key,
    this.onTapMenu,
    this.onTap,
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
        actions: [
          GestureDetector(
            onTap: onTap,
            child: SvgPicture.asset(
              AppAssets.search,
              height: 29.r,
              width: 29.r,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
