import 'package:flutter/material.dart';

import 'settings_language_model.dart';

final List<SettingsLanguageModel> languageList = [
  SettingsLanguageModel(name: "English (US)", code: "en_us", isSelected: true),
  SettingsLanguageModel(name: "English (UK)", code: "en_uk"),
  SettingsLanguageModel(name: "Mandarin", code: "zh"),
  SettingsLanguageModel(name: "Hindi", code: "hi"),
  SettingsLanguageModel(name: "Spanish", code: "es"),
  SettingsLanguageModel(name: "French", code: "fr"),
  SettingsLanguageModel(name: "Arabic", code: "ar"),
  SettingsLanguageModel(name: "Bengali", code: "bn"),
  SettingsLanguageModel(name: "Indonesian", code: "id"),
];

final ValueNotifier<List<SettingsLanguageModel>> languageNotifier =
    ValueNotifier<List<SettingsLanguageModel>>(List.from(languageList));

void selectLanguage(int index) {
  for (var lang in languageNotifier.value) {
    lang.isSelected = false;
  }
  languageNotifier.value[index].isSelected = true;
  languageNotifier.notifyListeners();
}
