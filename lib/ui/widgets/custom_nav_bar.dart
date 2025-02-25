// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../utils/constants/app_assets.dart';
// import '../../utils/constants/app_colors.dart';
// import '../../utils/constants/app_paddings.dart';
// import '../../utils/helpers/pager.dart';
// import 'custom_nav_bar_button.dart';
// import 'nav_bar_elements.dart';

// class CustomNavbar extends StatefulWidget {
//   final bool showButton;
//   final String? buttonTitle;
//   final VoidCallback? onButtonPressed;
//   final bool showIcon;

//   const CustomNavbar({
//     super.key,
//     this.showButton = false,
//     this.buttonTitle,
//     this.onButtonPressed,
//     this.showIcon = false,
//   });

//   @override
//   State<CustomNavbar> createState() => _CustomNavbarState();
// }

// class _CustomNavbarState extends State<CustomNavbar> {
//   int _selectedIndex = 0;

//   final List<Widget> _pages = [
//     Pager.home,
//     Pager.cart,
//     Container(),
//     Pager.favorite,
//     //Cart screen
//     //Notifacation screen
//     //Favorite screen
//   ];

//   void _onIconPressed(int index) {
//     if (_selectedIndex == index) return;

//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DecoratedBox(
//       decoration: const BoxDecoration(
//         color: AppColors.white,
//       ),
//       child: Padding(
//         padding: AppPaddings.h24,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             if (widget.showButton) 13.verticalSpace,
//             if (widget.showButton)
//               CustomNavbarButton(
//                 title: widget.buttonTitle ?? "Button",
//                 onPressed: widget.onButtonPressed ?? () {},
//                 showIcon: widget.showIcon,
//                 iconPath: AppAssets.arrowRight,
//               ),
//             if (widget.showButton) 19.verticalSpace,
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 NavBarElements(
//                   icon: Icons.home,
//                   index: 0,
//                   selectedIndex: _selectedIndex,
//                   onPressed: _onIconPressed,
//                 ),
//                 NavBarElements(
//                   icon: Icons.shopping_bag,
//                   index: 1,
//                   selectedIndex: _selectedIndex,
//                   onPressed: _onIconPressed,
//                 ),
//                 NavBarElements(
//                   icon: Icons.notifications,
//                   index: 2,
//                   selectedIndex: _selectedIndex,
//                   onPressed: _onIconPressed,
//                 ),
//                 NavBarElements(
//                   icon: Icons.favorite,
//                   index: 3,
//                   selectedIndex: _selectedIndex,
//                   onPressed: _onIconPressed,
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_store/cubits/main/main_cubit.dart';
import 'package:shop_store/data/models/local/bottom_nav_bar_item_model.dart';
import 'package:shop_store/utils/constants/app_colors.dart';
import 'package:shop_store/utils/constants/app_paddings.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,
    required this.activeIndex,
  });

  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MainCubit>();
    return Padding(
      padding: AppPaddings.h40,
      child: SizedBox(
        height: kBottomNavigationBarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            BottomNavBarItemModel.items.length,
            (i) {
              final item = BottomNavBarItemModel.items[i];
              return GestureDetector(
                onTap: () => cubit.changeTab(i),
                child: Icon(
                  item.icon,
                  color: activeIndex == i
                      ? AppColors.primary
                      : AppColors.madeInTheShade,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
