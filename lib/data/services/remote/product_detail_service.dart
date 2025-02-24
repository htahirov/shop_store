import 'package:shop_store/data/dio/auth_dio.dart';
import 'package:shop_store/utils/constants/api_keys.dart';
import 'package:shop_store/utils/extensions/int_extensions.dart';
import '../../models/remote/response/product_detail_response.dart';

class ProductDetailService {
  final _dio = AuthDio.instance.dio;

  Future<ProductDetailResponse?> getProductDetail(String slug) async {
    final endpoint = '${ApiKeys.productDetail}/$slug/';
    
    try {
      // 1 second delay
      await Future.delayed(const Duration(seconds: 1));
      
      final response = await _dio.get(endpoint);

      if (response.statusCode!.isSuccess) {
        return ProductDetailResponse.fromJson(response.data);
      }
      return null;
    } catch (e) {
      print('Error fetching product detail: $e');
      return null;
    }
  }
}