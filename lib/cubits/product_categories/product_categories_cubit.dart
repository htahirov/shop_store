import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_store/data/models/remote/response/product_categories_response.dart';

import '../../data/repo/product_repo.dart';

part 'product_categories_state.dart';

class ProductCategoriesCubit extends Cubit<ProductCategoriesState> {
  final ProductRepo productRepo;
  int? _selectedCategoryIndex;

  ProductCategoriesCubit(this.productRepo) : super(ProductCategoriesInitial());

  final mockCategories = List.generate(
    6,
    (i) => ProductCategoryResponse.mock(),
  );

  Future<void> getProductCategories() async {
    try {
      emit(ProductCategoriesLoading());
      final productCategoryResponse = await productRepo.getProductCategories();
      emit(ProductCategoriesSuccess(productCategoryResponse));
    } catch (e) {
      log("State: ProductCategoriesError, Error: $e");
      emit(ProductCategoriesError("An error occurred: $e"));
    }
  }

  void selectCategory(int index) {
    _selectedCategoryIndex = index;
    emit(ProductCategorySelected(_selectedCategoryIndex!));
  }
}
