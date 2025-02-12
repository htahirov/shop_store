import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:dio/dio.dart';
import 'package:shop_store/data/models/remote/response/product_response.dart';
import 'package:shop_store/utils/constants/api_keys.dart';

class SearchService {
  static const String _searchBox = 'recent_searches';
  static Future<List<Result>> getAllProducts() async {
    try {
      final response = await Dio().get(ApiKeys.product);
      if (response.statusCode == 200) {
        final ProductResponse productResponse =
            ProductResponse.fromJson(response.data);
        return productResponse.results ?? [];
      }
    } catch (e) {
      log("API error: $e");
      rethrow;
    }
    return [];
  }

  static Future<List<Result>> searchProducts(String query) async {
    try {
      final response =
          await Dio().get(ApiKeys.product, queryParameters: {'q': query});
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((item) => Result.fromJson(item)).toList();
      }
    } catch (e) {
      log("API error: $e");
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
}
