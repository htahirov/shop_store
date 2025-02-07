import 'package:flutter/material.dart';

import 'filter_text_styles.dart';

class CustomTitles extends StatelessWidget {
  const CustomTitles({super.key, required this.text});

  final text;

  @override
  Widget build(BuildContext context) {
    return Text("$text", style: FilterTextStyles.filterTitles);
  }
}
