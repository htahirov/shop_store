import 'dart:developer';
import 'package:dio/dio.dart';
import '../../../utils/extensions/int_extensions.dart';
import '../../../utils/constants/api_keys.dart';
import '../../dio/client_dio.dart';
import '../../models/remote/request/order_create_request.dart';
import '../../models/remote/response/order_response.dart';
import '../../models/remote/response/promo_code_response.dart';


class OrderService {
  final _dio = ClientDio.instance.dio;

  Future<OrderResponse> createOrder(OrderCreateRequest request) async {
    try {
      final response = await _dio.post(
        ApiKeys.orderCreate,
        data: request.toJson(),
      );

      if (response.statusCode!.isSuccess) {
        return OrderResponse.fromJson(response.data);
      }

      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        message: 'Failed to create order: ${response.statusCode}',
      );
    } catch (e) {
      log('Error creating order: $e');
      rethrow;
    }
  }

  Future<void> cancelOrder(String code) async {
    try {
      final response = await _dio.post(
        ApiKeys.orderCancel,
        data: {'code': code},
      );

      if (!response.statusCode!.isSuccess) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: 'Failed to cancel order: ${response.statusCode}',
        );
      }
    } catch (e) {
      log('Error canceling order: $e');
      rethrow;
    }
  }

  Future<PromoCodeResponse> checkPromoCode(String promoCode) async {
    try {
      final response = await _dio.post(
        ApiKeys.orderCheckPromo,
        data: {'promo_code': promoCode},
      );

      if (response.statusCode!.isSuccess) {
        return PromoCodeResponse.fromJson(response.data);
      }

      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        message: 'Failed to check promo code: ${response.statusCode}',
      );
    } catch (e) {
      log('Error checking promo code: $e');
      rethrow;
    }
  }

  Future<OrderResponse> getOrderDetail(String code) async {
    try {
      final response = await _dio.get(
        '${ApiKeys.orderDetail}/$code/',
      );

      if (response.statusCode!.isSuccess) {
        return OrderResponse.fromJson(response.data);
      }

      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        message: 'Failed to get order details: ${response.statusCode}',
      );
    } catch (e) {
      log('Error getting order details: $e');
      rethrow;
    }
  }

  Future<List<OrderResponse>> getOrders() async {
    try {
      final response = await _dio.get(
        ApiKeys.orderList,
      );

      if (response.statusCode!.isSuccess) {
        final List<dynamic> data = response.data;
        return data.map((json) => OrderResponse.fromJson(json)).toList();
      }

      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        message: 'Failed to get orders: ${response.statusCode}',
      );
    } catch (e) {
      log('Error getting orders: $e');
      rethrow;
    }
  }

  Future<Map<String, String>> trackOrder(String orderCode) async {
    try {
      final response = await _dio.get(
        '${ApiKeys.orderTrack}/$orderCode/',
      );

      if (response.statusCode!.isSuccess) {
        return {
          'date': response.data['date'],
          'status': response.data['status'],
        };
      }

      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        message: 'Failed to track order: ${response.statusCode}',
      );
    } catch (e) {
      log('Error tracking order: $e');
      rethrow;
    }
  }
}