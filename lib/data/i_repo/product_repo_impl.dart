
import 'package:shop_store/data/models/remote/response/product_categories_response.dart';

import '../models/remote/response/product_response.dart';
import '../repo/product_repo.dart';
import '../services/remote/product_service.dart';

class ProductRepoImpl implements ProductRepo {
   ProductRepoImpl(this._productService);

  final ProductService _productService;

  @override
  Future<ProductResponse> getProducts() => _productService.getProducts();

  @override
  Future<List<ProductCategoryResponse>> getProductCategories() => _productService.getProductCategories();
}