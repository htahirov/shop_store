import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/remote/response/product_response.dart';
import '../../data/services/remote/search_service.dart';
import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial()) {
    // loadInitialData();
  }

  final searchController = TextEditingController();

  final mockProducts = List.generate(6, (i) => Result.mock());

  final searchHistoryController = StreamController<List<String>>();
  final productController = StreamController<List<Result>?>();

  void getRecentSearches() async {
    try {
      final searches = await SearchService.getRecentSearches();
      searchHistoryController.add(searches);
    } catch (e, s) {
      log("Recent searches error: $e");
      log("Recent searches stack trace: $s");
      searchHistoryController.addError(e);
    }
  }

  void getProducts() async {
    try {
      final allProducts = await SearchService.getAllProducts();
      productController.sink.add(allProducts);
    } catch (e, s) {
      log("Recent searches error: $e");
      log("Recent searches stack trace: $s");
      productController.addError(e);
    }
  }

  void search(String query) async {
    if (query.isEmpty) return;
    try {
      productController.add(null);
      final results = await SearchService.searchProducts(query);
      await SearchService.saveSearch(query);
      getRecentSearches();
      productController.add(results);
    } catch (e, s) {
      log("Searches error: $e");
      log("Searches stack trace: $s");
      productController.addError(e);
    }
  }

  Future<void> clearSearches() async {
    await SearchService.clearSearches();
    getRecentSearches();
  }

  /*

  Future<void> search(String query) async {
    if (query.isEmpty) {
      emit(SearchSuccess(_allProducts, _allProducts));
      return;
    }

    emit(SearchLoading());

    try {
      final results = await SearchService.searchProducts(query);
      await SearchService.saveSearch(query);
      await loadRecentSearches();
      emit(SearchSuccess(_allProducts, results));
    } catch (e) {
      emit(SearchError("Axtarış zamanı xəta baş verdi: ${e.toString()}"));
    }
  }

  void resetSearch() {
    emit(SearchSuccess(_allProducts, _allProducts));
  }

  Future<void> clearSearches() async {
    await SearchService.clearSearches();
    loadRecentSearches();
  }

  Future<void> removeSearch(String query) async {
    final box = await Hive.openBox<String>('recent_searches');
    final searchList = box.values.toList();
    final index = searchList.indexOf(query);
    if (index != -1) {
      await box.deleteAt(index);
    }
    loadRecentSearches();
  } */

}
