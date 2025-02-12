import 'package:flutter/material.dart';
import '../../utils/constants/app_colors.dart';

class CustomFavoriteButton extends StatefulWidget {
  const CustomFavoriteButton({super.key});

  @override
  State<CustomFavoriteButton> createState() => _CustomFavoriteButtonState();
}

class _CustomFavoriteButtonState extends State<CustomFavoriteButton> {
  bool _isFavorited = false; 

  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.platinum,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(
          _isFavorited ? Icons.favorite : Icons.favorite_border, 
          color: _isFavorited ? AppColors.redmana : null,
        ),
        onPressed: _toggleFavorite,
      ),
    );
  }
}
