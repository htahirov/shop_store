import 'package:flutter/material.dart';

import '../../../utils/constants/app_assets.dart';
import '../../../utils/helpers/pager.dart';
import '../../widgets/custom_app_bar.dart';
import 'widgets/settings_tile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Settings",
        onLeadingPressed: () => Navigator.pop(context),
      ),
      body: Column(
        children: [
          SettingsTile(
            iconPath: AppAssets.language,
            title: "Language",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Pager.settingsLanguage),
              );
            },
          ),
          SettingsTile(
            iconPath: AppAssets.terms, 
            title: "Terms of Use",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Pager.settingsPrivacyPolicy),
              );
            },
          ),
          SettingsTile(
            iconPath: AppAssets.info, 
            title: "Privacy Policy",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Pager.settingsPrivacyPolicy),
              );
            },
          ),
        ],
      ),
    );
  }
}
