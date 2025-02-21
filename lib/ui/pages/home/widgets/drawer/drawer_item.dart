import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback? onTap; // Yeni onTap funksiyası

  const DrawerItem({
    required this.title,
    this.isActive = false,
    this.onTap, 
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, 
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            if (isActive)
              Icon(Icons.circle, size: 8, color: Colors.white)
            else
              SizedBox(width: 8),
            SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
