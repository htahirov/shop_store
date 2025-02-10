import 'package:shop_store/data/models/remote/response/product_categories_response.dart';

import '../models/remote/response/product_response.dart';

abstract class ProductRepo {
  Future<ProductResponse> getProducts();
  Future<List<ProductCategoryResponse>> getProductCategories();
}
