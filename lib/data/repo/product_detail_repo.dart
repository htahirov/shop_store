import '../models/remote/response/product_detail_response.dart';

abstract class ProductDetailRepo {
  Future<ProductDetailResponse?> getProductDetail(String slug);
}