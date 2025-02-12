import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../data/models/remote/request/basket_create_request.dart';
import '../../data/models/remote/response/product_detail_response.dart';
import '../../data/repo/basket_repo.dart';
import '../../data/repo/product_detail_repo.dart';

part 'product_detail_state.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  final ProductDetailRepo _productDetailRepo;
  final BasketRepo _basketRepo;

  ProductDetailCubit(this._productDetailRepo, this._basketRepo) : super(ProductDetailInitial());

  bool isDescriptionExpanded = false;
  bool isReviewsExpanded = false;
  ProductDetailResponse? productDetail;

  void toggleDescription() {
    isDescriptionExpanded = !isDescriptionExpanded;
    emit(ProductDetailUpdated());
  }

  void toggleReviews() {
    isReviewsExpanded = !isReviewsExpanded;
    emit(ProductDetailUpdated());
  }

  Future<void> getProductDetail(String slug) async {
    try {
      emit(ProductDetailLoading());
      final response = await _productDetailRepo.getProductDetail(slug);
      if (response != null) {
        productDetail = response;
        emit(ProductDetailSuccess());
      } else {
        emit(ProductDetailError('Failed to load product details'));
      }
    } catch (e) {
      emit(ProductDetailError(e.toString()));
    }
  }

  Future<void> addToCart({
    required int productId,
    required int colorId,
    required int sizeId,
    required int quantity,
  }) async {
    try {
      emit(ProductDetailLoading());
      
      final request = BasketCreateRequest(
        product: productId,
        color: colorId,
        size: sizeId,
        quantity: quantity,
      );
      
      await _basketRepo.createBasketItem(request);
      emit(ProductDetailSuccess());
    } catch (e) {
      emit(ProductDetailError(e.toString()));
    }
  }

  void addToFavorites() {
    // TODO: Implement favorites logic
    emit(ProductDetailUpdated());
  }
}