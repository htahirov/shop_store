import 'package:dio/dio.dart';
import 'package:shop_store/data/dio/client_dio.dart';
import 'dart:developer';
import '../../../utils/constants/api_keys.dart';
import '../../../utils/extensions/int_extensions.dart';
import '../../models/remote/request/basket_create_request.dart';
import '../../models/remote/request/basket_update_request.dart';
import '../../models/remote/response/basket_item_response.dart';
import '../local/auth_hive_service.dart';

class BasketService {
  // final _dio = Dio(
  //   BaseOptions(
  //     headers: {
  //       'Accept': '*/*',
  //       'User-Agent': 'PostmanRuntime/7.43.0',
  //       'Accept-Encoding': 'gzip, deflate, br',
  //       'Connection': 'keep-alive',
  //     },
  //     validateStatus: (status) {
  //       return status! < 500;
  //     },
  //   ),
  // );

  final _dio = ClientDio.instance.dio;

  Future<List<BasketItem>> getBasketItems() async {
    try {
      final response = await _dio.get(
        ApiKeys.basketList,
        options: Options(
          headers: {
            'Authorization':
                'Bearer ${(await AuthHiveService.getData())?.tokens.access}',
          },
        ),
      );

      log('Basket Response: ${response.data}');

      if (response.statusCode!.isSuccess) {
        if (response.data is List) {
          return (response.data as List)
              .map((json) => BasketItem.fromJson(json as Map<String, dynamic>))
              .toList();
        } else if (response.data is Map) {
          final results = response.data['results'];
          if (results is List) {
            return results
                .map(
                    (json) => BasketItem.fromJson(json as Map<String, dynamic>))
                .toList();
          }
        }
        return [];
      }

      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        message: 'Failed to get basket items: ${response.statusCode}',
      );
    } catch (e, s) {
      log('Error getting basket items: $e');
      log('Stack trace: $s');
      rethrow;
    }
  }

  Future<void> createBasketItem(BasketCreateRequest request) async {
    try {
      final response = await _dio.post(
        ApiKeys.basketCreate,
        data: request.toJson(),
        options: Options(
          headers: {
            'Authorization':
                'Bearer ${(await AuthHiveService.getData())?.tokens.access}',
          },
        ),
      );

      if (!response.statusCode!.isSuccess) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: 'Failed to create basket item: ${response.statusCode}',
        );
      }
    } catch (e, s) {
      log('Error creating basket item: $e');
      log('Stack trace: $s');
      rethrow;
    }
  }

  Future<void> deleteBasketItem(String id) async {
    try {
      final response = await _dio.delete(
        '${ApiKeys.basketDelete}/$id/',
        options: Options(
          headers: {
            'Authorization':
                'Bearer ${(await AuthHiveService.getData())?.tokens.access}',
          },
        ),
      );

      if (!response.statusCode!.isSuccess) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: 'Failed to delete basket item: ${response.statusCode}',
        );
      }
    } catch (e, s) {
      log('Error deleting basket item: $e');
      log('Stack trace: $s');
      rethrow;
    }
  }

  Future<BasketItem> updateBasketItem(
      String id, BasketUpdateRequest request) async {
    try {
      final response = await _dio.patch(
        '${ApiKeys.basketUpdate}/$id/',
        data: request.toJson(),
        options: Options(
          headers: {
            'Authorization':
                'Bearer ${(await AuthHiveService.getData())?.tokens.access}',
          },
        ),
      );

      if (response.statusCode!.isSuccess) {
        return BasketItem.fromJson(response.data);
      }

      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        message: 'Failed to update basket item: ${response.statusCode}',
      );
    } catch (e, s) {
      log('Error updating basket item: $e');
      log('Stack trace: $s');
      rethrow;
    }
  }
}
