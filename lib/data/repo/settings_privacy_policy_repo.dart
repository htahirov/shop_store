import 'package:shop_store/data/services/remote/settings_privacy_policy_service.dart';

import '../models/remote/response/settings_privacy_policy_response.dart';

abstract class SettingsPrivacyPolicyRepo {
  SettingsPrivacyPolicyRepo(SettingsPrivacyPolicyService settingsPrivacyPolicyService);

  Future<SettingsPrivacyPolicyResponse> getPrivacyPolicy();
}
