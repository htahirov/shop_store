import 'package:shop_store/utils/extensions/int_extensions.dart';

import '../../../utils/constants/api_keys.dart';
import '../../dio/auth_dio.dart';
import '../../models/remote/request/login_request.dart';
import '../../models/remote/response/login_response.dart';

class AuthService {
  Future<LoginResponse?> login({
    required LoginRequest request,
  }) async {
    final dio = AuthDio.instance.dio;
    const endpoint = ApiKeys.login;
    final response = await dio.post(
      endpoint,
      data: request.toJson(),
    );

    if (response.statusCode!.isSuccess) {
      final data = LoginResponse.fromJson(response.data);
      return data;
    }
    return null;
  }
}
