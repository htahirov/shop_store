class SettingsLanguageModel {
  final String name;
  final String code;
  bool isSelected;

  SettingsLanguageModel({
    required this.name,
    required this.code,
    this.isSelected = false,
  });
}
