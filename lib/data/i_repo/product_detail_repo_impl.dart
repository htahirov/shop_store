import '../models/remote/response/product_detail_responce.dart';
import '../repo/product_detail_repo.dart';
import '../services/remote/product_detail_service.dart';

class ProductDetailRepoImpl implements ProductDetailRepo {
  final ProductDetailService _productDetailService;

  ProductDetailRepoImpl(this._productDetailService);

  @override
  Future<ProductDetailResponse?> getProductDetail(String slug) => 
      _productDetailService.getProductDetail(slug);
}