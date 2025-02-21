import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:shop_store/data/models/remote/response/user_profile.dart';
import 'package:shop_store/utils/constants/api_keys.dart';
import '../../models/remote/request/signup_request.dart';

class SignUpService {
  final Dio _dio = Dio(
    BaseOptions(
      headers: {
        'Accept': 'application/json', 
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
      },
      validateStatus: (status) => status != null && status >= 200 && status < 300, 
    ),
  );

  Future<UserProfile?> signUp(SignUpRequest request) async {
    try {
      final response = await _dio.post(
        ApiKeys.register, 
        data: request.toJson(),
      );

      log("Response Status: ${response.statusCode}");
      log("Response Data: ${response.data}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data is Map<String, dynamic>) {
          return UserProfile.fromMap(response.data);
        } else {
          throw Exception('Invalid response format: ${response.data}');
        }
      } else {
        throw Exception('Sign up failed with status code: ${response.statusCode}');
      }
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        log('Dio error response: ${dioError.response?.data}');
        log('Dio error status: ${dioError.response?.statusCode}');
        log('Dio error headers: ${dioError.response?.headers}');
      } else {
        log('Dio error: ${dioError.message}');
      }
      throw Exception("DioException occurred: ${dioError.message}");
    } catch (e) {
      log('Unexpected error: $e');
      throw Exception('Unexpected error during sign-up: $e');
    }
  }
}
