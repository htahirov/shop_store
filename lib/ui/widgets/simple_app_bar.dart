import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/constants/app_assets.dart';
import '../../utils/constants/app_paddings.dart';
import 'custom_favorite_button.dart';

class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> actions;
  final void Function()? onTapMenu;

  SimpleAppBar.home({super.key, this.onTapMenu})
      : actions = [
          SvgPicture.asset(
            AppAssets.search,
            height: 29.r,
            width: 29.r,
          ),
        ];

  // SimpleAppBar.product({super.key})
  //     : actions = [
  //         const CustomFavoriteButton(),
  //       ];
  SimpleAppBar.product({super.key, this.onTapMenu})
      : actions = [
          const CustomFavoriteButton(),
        ];

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
