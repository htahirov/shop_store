class SettingsPrivacyPolicyResponse {
  final String title;
  final String content;

  SettingsPrivacyPolicyResponse({required this.title, required this.content});

  factory SettingsPrivacyPolicyResponse.fromJson(Map<String, dynamic> json) {
    return SettingsPrivacyPolicyResponse(
      title: json["title"] ?? "Privacy Policy",
      content: json["content"] ?? "",
    );
  }
}
