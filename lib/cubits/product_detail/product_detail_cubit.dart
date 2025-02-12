import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../data/models/remote/response/product_detail_response.dart';
import '../../data/repo/product_detail_repo.dart';

part 'product_detail_state.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  final ProductDetailRepo _productDetailRepo;

  ProductDetailCubit(this._productDetailRepo) : super(ProductDetailInitial());

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

  void addToFavorites() {
    // TODO: Implement favorites logic
    emit(ProductDetailUpdated());
  }

  void addToCart() {
    // TODO: Implement cart logic
    emit(ProductDetailSuccess());
  }
}