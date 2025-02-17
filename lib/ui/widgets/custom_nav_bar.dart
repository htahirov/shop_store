import 'package:flutter/material.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_paddings.dart';
import '../../../utils/helpers/go.dart';
import '../../../utils/helpers/pager.dart';
import 'nav_bar_elements.dart';

class CustomNavbar extends StatelessWidget {
  const CustomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    // Get current route name
    final currentRoute = ModalRoute.of(context)?.settings.name ?? '';
    // Determine the selected index based on the route
    final selectedIndex = _getSelectedIndex(currentRoute);

    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.white,
      ),
      child: Padding(
        padding: AppPaddings.a16,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavBarElements(
              icon: Icons.home,
              index: 0,
              selectedIndex: selectedIndex,
              onPressed: (index) => _onIconPressed(context, index),
            ),
            NavBarElements(
              icon: Icons.shopping_bag,
              index: 1,
              selectedIndex: selectedIndex,
              onPressed: (index) => _onIconPressed(context, index),
            ),
            NavBarElements(
              icon: Icons.notifications,
              index: 2,
              selectedIndex: selectedIndex,
              onPressed: (index) => _onIconPressed(context, index),
            ),
            NavBarElements(
              icon: Icons.favorite,
              index: 3,
              selectedIndex: selectedIndex,
              onPressed: (index) => _onIconPressed(context, index),
            ),
          ],
        ),
      ),
    );
  }

  int _getSelectedIndex(String route) {
    if (route.contains('/cart')) return 1;
    if (route.contains('/notifications')) return 2;
    if (route.contains('/favorites')) return 3;
    return 0;
  }

  void _onIconPressed(BuildContext context, int index) {
    switch (index) {
      case 0:
        Go.replace(context, Pager.home);
        break;
      case 1:
        Go.replace(context, Pager.cart);
        break;
      case 2:
        // TODO: Implement notifications
        break;
      case 3:
        // TODO: Implement favorites
        break;
    }
  }
}