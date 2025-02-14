import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../data/models/remote/response/product_response.dart';
import '../../data/services/remote/search_service.dart';
import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial()) {
    // loadInitialData();
  }
  Timer? _debounce;

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
   _debounce?.cancel();

    _debounce = Timer(const Duration(seconds:1), () async {
      if (query.isEmpty){ 
        getProducts();
        return;}
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
    );
   }
  

 void removeSearch(String query) async {
    final box = await Hive.openBox<String>('recent_searches');
    final searchList = box.values.toList();
    final index = searchList.indexOf(query);
    if (index != -1) {
      await box.deleteAt(index);
    }
    getRecentSearches();
  }

  Future<void> clearSearches() async {
    await SearchService.clearSearches();
    getRecentSearches();
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
