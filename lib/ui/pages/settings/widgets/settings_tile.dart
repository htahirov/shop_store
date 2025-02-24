import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsTile extends StatelessWidget {
  final String iconPath; 
  final String title;
  final VoidCallback onTap;

  const SettingsTile({
    super.key,
    required this.iconPath,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(iconPath, width: 24, height: 24), 
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }
}
