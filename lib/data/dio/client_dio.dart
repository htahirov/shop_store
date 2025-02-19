import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../utils/constants/app_durations.dart';
import 'interceptors/token_interceptor.dart';

class ClientDio {
  ClientDio._();

  static ClientDio? _instance;
  Dio? _dio;

  static ClientDio get instance => _instance ??= ClientDio._();

  Dio get dio {
    _dio ??= Dio(
      BaseOptions(
        sendTimeout: AppDurations.s2,
        connectTimeout: AppDurations.s20,
        receiveTimeout: AppDurations.s20,
      ),
    );

    if (kDebugMode) _dio!.interceptors.add(AwesomeDioInterceptor());
    _dio!.interceptors.add(TokenDioInterceptor());

    return _dio!;
  }
}
