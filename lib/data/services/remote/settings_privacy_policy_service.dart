import 'package:dio/dio.dart';
import 'package:shop_store/data/dio/auth_dio.dart';

import '../../../utils/constants/api_keys.dart';
import '../../models/remote/response/settings_privacy_policy_response.dart'; 

class SettingsPrivacyPolicyService {
  final Dio _dio = AuthDio.instance.dio;

  Future<SettingsPrivacyPolicyResponse> fetchPrivacyPolicy() async {
    try {
      final response = await _dio.get(ApiKeys.settingsPrivacy); 

      if (response.statusCode == 200) {
        return SettingsPrivacyPolicyResponse.fromJson(response.data);
      } else {
        throw Exception("Privacy policy yüklənərkən API xətası: ${response.statusMessage}");
      }
    } catch (e) {
      throw Exception("Privacy policy yüklənərkən xəta baş verdi: $e");
    }
  }
}
