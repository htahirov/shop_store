import 'package:flutter/material.dart';

import '../../utils/constants/app_colors.dart';
import '../../utils/constants/app_paddings.dart';

class NavBarElements extends StatelessWidget {
  final IconData icon;
  final int index;
  final int selectedIndex;
  final Function(int) onPressed;

  const NavBarElements({
    super.key,
    required this.icon,
    required this.index,
    required this.selectedIndex,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (selectedIndex == index)
          Container(
            padding: AppPaddings.t4,
            height: 3.0,
            width: 28.0,
            color: AppColors.jadePalace, 
          ),
        IconButton(
          icon: Icon(
            icon,
            size: 25,
          ),
          color: selectedIndex == index
              ? AppColors.jadePalace
              : AppColors.madeInTheShade,
          onPressed: () => onPressed(index),
        ),
        
      ],
    );
  }
}
