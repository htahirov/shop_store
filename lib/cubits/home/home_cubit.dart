import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/remote/response/product_response.dart';
import '../../data/repo/product_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ProductRepo _productRepo;

  HomeCubit(this._productRepo) : super(HomeInitial());

  final products = List.generate(6, (i) => Result.mock());

  void getProducts() async {
    try {
      emit(HomeLoading());
      final productResponse = await _productRepo.getProducts();
      emit(HomeSuccess(productResponse));
    } catch (e, s) {
      log('Error: $e');
      log('Stack Trace: $s');
      emit(HomeError("Error occurred in Home Cubit"));
    }
  }
}
