import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'product_detail_state.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit() : super(ProductDetailInitial());

  bool isDescriptionExpanded = false;
  bool isReviewsExpanded = false;

  void toggleDescription() {
    isDescriptionExpanded = !isDescriptionExpanded;
    emit(ProductDetailUpdated());
  }

  void toggleReviews() {
    isReviewsExpanded = !isReviewsExpanded;
    emit(ProductDetailUpdated());
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

class ProductDetailUpdated extends ProductDetailState {}