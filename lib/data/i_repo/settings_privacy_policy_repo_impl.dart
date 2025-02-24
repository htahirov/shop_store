import '../models/remote/response/settings_privacy_policy_response.dart';
import '../repo/settings_privacy_policy_repo.dart';
import '../services/remote/settings_privacy_policy_service.dart';

class ISettingsPrivacyPolicyRepo implements SettingsPrivacyPolicyRepo {
  final SettingsPrivacyPolicyService _service;

  ISettingsPrivacyPolicyRepo(this._service);

  @override
  Future<SettingsPrivacyPolicyResponse> getPrivacyPolicy() async {
    return await _service.fetchPrivacyPolicy();
  }
}
