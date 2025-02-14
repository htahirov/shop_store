import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:dio/dio.dart';
import 'package:shop_store/data/dio/auth_dio.dart';
import 'package:shop_store/data/models/remote/response/product_response.dart';
import 'package:shop_store/utils/constants/api_keys.dart';

class SearchService {
  static const String _searchBox = 'recent_searches';
  static Future<List<Result>> getAllProducts() async {
    try {
      final response = await AuthDio.instance.dio.get(ApiKeys.product);
      if (response.statusCode == 200) {
        final ProductResponse productResponse =
            ProductResponse.fromJson(response.data);
        return productResponse.results ?? [];
      }
    } catch (e, s) {
      log("API error: $e");
      log("Stack trace error: $s");
      rethrow;
    }
    return [];
  }

  static Future<List<Result>> searchProducts(String query) async {
    try {
      final response = await AuthDio.instance.dio.get(
        ApiKeys.product,
        queryParameters: {'search': query},
      );
      if (response.statusCode == 200) {
        final ProductResponse productResponse =
            ProductResponse.fromJson(response.data);
        return productResponse.results ?? [];
      }
    } catch (e, s) {
      log("API error: $e");
      log("Stack trace error: $s");
    }
    return [];
  }

  static Future<void> saveSearch(String query) async {
    final box = await Hive.openBox<String>(_searchBox);
    if (!box.values.contains(query)) {
      await box.add(query);
    }
  }

  static Future<List<String>> getRecentSearches() async {
    final box = await Hive.openBox<String>(_searchBox);
    return box.values.toList().reversed.toList();
  }

  static Future<void> clearSearches() async {
    final box = await Hive.openBox<String>(_searchBox);
    await box.clear();
  }
   void removeSearch(String query) async {
    final box = await Hive.openBox<String>('recent_searches');
    final searchList = box.values.toList();
    final index = searchList.indexOf(query);
    if (index != -1) {
      await box.deleteAt(index);
    }
  }
}
