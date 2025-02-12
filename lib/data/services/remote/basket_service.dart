import '../../../utils/constants/api_keys.dart';
import '../../../utils/extensions/int_extensions.dart';
import '../../dio/client_dio.dart';
import '../../models/remote/request/basket_create_request.dart';
import '../../models/remote/request/basket_update_request.dart';
import '../../models/remote/response/basket_item_response.dart';

class BasketService {
  final _dio = ClientDio.instance.dio;

  Future<void> createBasketItem(BasketCreateRequest request) async {
    final response = await _dio.post(
      ApiKeys.basketCreate,
      data: request.toJson(),
    );

    if (!response.statusCode!.isSuccess) {
      throw Exception('Failed to create basket item');
    }
  }

  Future<void> deleteBasketItem(String id) async {
    final response = await _dio.delete(
      '${ApiKeys.basketDelete}/$id/',
    );

    if (!response.statusCode!.isSuccess) {
      throw Exception('Failed to delete basket item');
    }
  }

  Future<List<BasketItem>> getBasketItems() async {
    final response = await _dio.get(ApiKeys.basketList);

    if (response.statusCode!.isSuccess) {
      final List<dynamic> data = response.data;
      return data.map((json) => BasketItem.fromJson(json)).toList();
    }
    throw Exception('Failed to get basket items');
  }

  Future<BasketItem> updateBasketItem(String id, BasketUpdateRequest request) async {
    final response = await _dio.patch(
      '${ApiKeys.basketUpdate}/$id/',
      data: request.toJson(),
    );

    if (response.statusCode!.isSuccess) {
      return BasketItem.fromJson(response.data);
    }
    throw Exception('Failed to update basket item');
  }
}