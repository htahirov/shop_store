import 'package:flutter/material.dart';

import '../../utils/constants/app_colors.dart';
import '../../utils/constants/app_paddings.dart';
import '../pages/favorite/favorite_page.dart';
import 'nav_bar_elements.dart';

class CustomNavbar extends StatefulWidget {
  const CustomNavbar({super.key});

  @override
  State<CustomNavbar> createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  int _selectedIndex = 0;

  void _onIconPressed(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (_selectedIndex == 3) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const FavoritePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
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
              selectedIndex: _selectedIndex,
              onPressed: _onIconPressed,
            ),
            NavBarElements(
              icon: Icons.shopping_bag,
              index: 1,
              selectedIndex: _selectedIndex,
              onPressed: _onIconPressed,
            ),
            NavBarElements(
              icon: Icons.notifications,
              index: 2,
              selectedIndex: _selectedIndex,
              onPressed: _onIconPressed,
            ),
            NavBarElements(
              icon: Icons.favorite,
              index: 3,
              selectedIndex: _selectedIndex,
              onPressed: _onIconPressed,
            ),
          ],
        ),
      ),
    );
  }
}
