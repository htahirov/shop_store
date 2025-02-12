
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shop_store/data/models/remote/response/product_response.dart';
import 'package:shop_store/data/services/remote/search_service.dart';

import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  List<Result> _allProducts = [];

  SearchCubit() : super(SearchInitial()) {
    loadInitialData(); 
  }

  Future<void> loadInitialData() async {
    emit(SearchLoading());
    try {
      _allProducts = await SearchService.getAllProducts();
      await loadRecentSearches();
      emit(SearchSuccess(_allProducts, _allProducts));
    } catch (e) {
      emit(SearchError("Məhsulları yükləyərkən xəta baş verdi!"));
    }
  }

  Future<void> loadRecentSearches() async {
    try {
      final searches = await SearchService.getRecentSearches();
      emit(SearchRecentLoaded(searches));
    } catch (e) {
      log("Recent searches error: $e");
    }
  }

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
  }
}
