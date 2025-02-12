import 'dart:developer';

import '../../../utils/constants/api_keys.dart';
import '../../../utils/extensions/int_extensions.dart';
import '../../dio/auth_dio.dart';
import '../../models/remote/response/product_categories_response.dart';
import '../../models/remote/response/product_response.dart';

class ProductService {
  Future<ProductResponse> getProducts() async {
    final dio = AuthDio.instance.dio;
    const endpoint = ApiKeys.product;

    log('Endpoint: $endpoint');

    try {
      final response = await dio.get(endpoint);
      log('Raw Response: ${response.data}');

      if (response.statusCode!.isSuccess) {
        return ProductResponse.fromJson(response.data);
      } else if (response.statusCode == 404) {
        throw Exception('No data found for product');
      }
      throw Exception("Product exception");
    } catch (e) {
      log("API Request Error: $e");
      throw Exception("Failed to fetch product data");
    }
  }

  Future<List<ProductCategoryResponse>> getProductCategories() async {
    final dio = AuthDio.instance.dio;
    const endpoint = ApiKeys.productCategories;
    final response = await dio.get(
      endpoint,
    );

    if (response.statusCode!.isSuccess) {
      final List<dynamic> data = response.data;
      return data
          .map((json) => ProductCategoryResponse.fromJson(json))
          .toList();
    }

    return [];
  }
}
