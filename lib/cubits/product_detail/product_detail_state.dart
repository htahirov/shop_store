part of 'product_detail_cubit.dart';

@immutable
abstract class ProductDetailState {}

class ProductDetailInitial extends ProductDetailState {}

class ProductDetailLoading extends ProductDetailState {}

class ProductDetailSuccess extends ProductDetailState {}

class ProductDetailError extends ProductDetailState {
  final String message;

  ProductDetailError(this.message);
}

