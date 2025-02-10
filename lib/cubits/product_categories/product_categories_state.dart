part of 'product_categories_cubit.dart';

@immutable
sealed class ProductCategoriesState {}

final class ProductCategoriesInitial extends ProductCategoriesState {}

final class ProductCategoriesLoading extends ProductCategoriesState {}

final class ProductCategoriesSuccess extends ProductCategoriesState {
  final List<ProductCategoryResponse> productCategoryResponse;

  ProductCategoriesSuccess(this.productCategoryResponse);
}

final class ProductCategoriesError extends ProductCategoriesState {
  final String message;

  ProductCategoriesError(this.message);
}

final class ProductCategoriesNetworkError extends ProductCategoriesState {
  final String message;

  ProductCategoriesNetworkError(this.message);
}

class ProductCategorySelected extends ProductCategoriesState {
  final int selectedCategoryIndex;

  ProductCategorySelected(this.selectedCategoryIndex);
}
