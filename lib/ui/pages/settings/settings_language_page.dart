import 'package:flutter/material.dart';

import '../../../data/models/local/settings_language_data.dart';
import '../../../data/models/local/settings_language_model.dart';

class SettingsLanguagePage extends StatelessWidget {
  const SettingsLanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: ValueListenableBuilder<List<SettingsLanguageModel>>(
        valueListenable: languageNotifier,
        builder: (context, languages, child) {
          return ListView.builder(
            itemCount: languages.length,
            itemBuilder: (context, index) {
              return CheckboxListTile(
                title: Text(languages[index].name),
                value: languages[index].isSelected,
                onChanged: (_) => selectLanguage(index), 
              );
            },
          );
        },
      ),
    );
  }
}
