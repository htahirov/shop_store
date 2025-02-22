import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:shop_store/data/dio/auth_dio.dart';
import 'package:shop_store/data/models/remote/response/user_profile.dart';
import 'package:shop_store/utils/constants/api_keys.dart';
import 'package:shop_store/utils/extensions/int_extensions.dart';
import '../../models/remote/request/signup_request.dart';

class SignUpService {
  Future<UserProfile?> signUp(SignUpRequest request) async {
    try {
      final response = await AuthDio.instance.dio.post(
        ApiKeys.register,
        data: request.toJson(),
      );

      log("Response Status: ${response.statusCode}");
      log("Response Data: ${response.data}");

      if (response.statusCode!.isSuccess) {
        return UserProfile.fromMap(response.data);
      } else {
        throw Exception(
            'Sign up failed with status code: ${response.statusCode}');
      }
    } on DioException catch (dioError) {
      throw Exception("DioException occurred: ${dioError.message}");
    } catch (e, s) {
      log('Unexpected error: $e');
      log('StackTrace Unexpected error: $s');
      throw Exception('Unexpected error during sign-up: $e');
    }
  }
}
