import 'package:flutter/material.dart';

class BottomNavBarItemModel {
  const BottomNavBarItemModel({
    required this.icon,
    required this.title,
    required this.index,
  });

  final IconData icon;
  final String title;
  final int index;

  static const List<BottomNavBarItemModel> items = [
    BottomNavBarItemModel(icon: Icons.home, title: 'Home', index: 0),
    BottomNavBarItemModel(icon: Icons.shopping_bag, title: 'Basket', index: 1),
    BottomNavBarItemModel(icon: Icons.notifications, title: 'Bell', index: 2),
    BottomNavBarItemModel(icon: Icons.favorite, title: 'Favorite', index: 3),
  ];
}
