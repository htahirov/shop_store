import '../models/remote/response/product_detail_responce.dart';

abstract class ProductDetailRepo {
  Future<ProductDetailResponse?> getProductDetail(String slug);
}