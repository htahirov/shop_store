import 'package:flutter/foundation.dart';
import 'package:shop_store/data/models/remote/response/product_response.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {
  final List<Result> allProducts;   
  final List<Result> searchResults;

  SearchSuccess(this.allProducts, this.searchResults);
}

final class SearchError extends SearchState {
  final String message;
  SearchError(this.message);
}
final class SearchNetworkError extends SearchState {
  final String message;
  SearchNetworkError(this.message);
}

final class SearchRecentLoaded extends SearchState {
  final List<String> recentSearches;
  SearchRecentLoaded(this.recentSearches);
}
