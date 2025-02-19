import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants/app_colors.dart';
import '../../utils/constants/app_constants.dart';

class OrderTabBar extends StatelessWidget {
  const OrderTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: ButtonsTabBar(
        backgroundColor: AppColors.jadePalace,
        unselectedBackgroundColor: Colors.transparent,
        labelStyle: TextStyle(
          color: AppColors.titleTextColor,
          fontSize: 14.sp,
          fontFamily: AppConstants.fontFamilyNunito,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: TextStyle(
          color: AppColors.titleTextColor,
          fontSize: 14.sp,
          fontFamily: AppConstants.fontFamilyNunito,
          fontWeight: FontWeight.w400,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
        tabs: const [
          Tab(text: 'On Going'),
          Tab(text: 'Completed'),
          Tab(text: 'Cancelled'),
        ],
      ),
    );
  }
}