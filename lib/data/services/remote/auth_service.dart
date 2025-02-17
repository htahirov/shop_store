import 'package:shop_store/utils/extensions/int_extensions.dart';
import 'package:dio/dio.dart';
import '../../../utils/constants/api_keys.dart';
import '../../models/remote/request/login_request.dart';
import '../../models/remote/response/login_response.dart';

// class AuthService {
//   Future<LoginResponse?> login({
//     required LoginRequest request,
//   }) async {
//     final dio = AuthDio.instance.dio;
//     const endpoint = ApiKeys.login;
//     final response = await dio.post(
//       endpoint,
//       data: request.toJson(),
//     );

//     if (response.statusCode!.isSuccess) {
//       final data = LoginResponse.fromJson(response.data);
//       return data;
//     }
//     return null;
//   }
// }


class AuthService {
  final _dio = Dio(
    BaseOptions(
      headers: {
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
      },
      validateStatus: (status) {
        return status! < 500;
      },
    ),
  );

  Future<LoginResponse?> login({
    required LoginRequest request,
  }) async {
    try {
      final response = await _dio.post(
        ApiKeys.login,
        data: request.toJson(),
      );

      if (response.statusCode!.isSuccess) {
        return LoginResponse.fromJson(response.data);
      }

      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        message: 'Login failed with status code: ${response.statusCode}',
      );
    } on DioException {
      rethrow;
    } catch (e) {
      throw Exception('Unexpected error during login: $e');
    }
  }
}