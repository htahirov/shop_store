import 'package:dio/dio.dart';
import 'package:shop_store/utils/constants/api_keys.dart';
import 'package:shop_store/utils/extensions/int_extensions.dart';
import '../../models/remote/response/product_detail_response.dart';

class ProductDetailService {
  Future<ProductDetailResponse?> getProductDetail(String slug) async {
    final dio = Dio(
      BaseOptions(
        headers: {
          'Accept': '*/*',
          'User-Agent': 'PostmanRuntime/7.43.0',
          'Accept-Encoding': 'gzip, deflate, br',
          'Connection': 'keep-alive',
        },
      ),
    );
    
    final endpoint = '${ApiKeys.productDetail}/$slug/';
    
    try {
      // 1 second delay
      await Future.delayed(const Duration(seconds: 1));
      
      final response = await dio.get(
        endpoint,
        options: Options(
          validateStatus: (status) {
            return status != null && status < 500;
          },
        ),
      );

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