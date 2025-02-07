import 'package:flutter/material.dart';

class CustomColorsCircles extends StatelessWidget {
  final Color? selectedColor;

  CustomColorsCircles({
    super.key,
    this.selectedColor,
  });

  final List<Color> colors = [
    Colors.black,
    Colors.brown,
    Colors.orange,
    Colors.red,
    Colors.purple,
    Colors.blue,
    Colors.pink
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      children: List.generate(colors.length, (index) {
        Color color = colors[index];
        return GestureDetector(
          onTap: () {},
          child: CircleAvatar(
            backgroundColor: color,
            radius: 11,
          ),
        );
      }),
    );
  }
}
