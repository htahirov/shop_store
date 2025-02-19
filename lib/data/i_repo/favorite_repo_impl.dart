import 'dart:developer';

import '../models/remote/response/product_response.dart';
import '../repo/favorite_repo.dart';
import '../services/remote/favorite_service.dart';

class IFavoriteRepository implements FavoriteRepository {
  final FavoriteService _favoriteService;

  IFavoriteRepository(this._favoriteService);

  @override
  Future<void> addToFavorites(int productId) async {
    try {
      await _favoriteService.addToFavorites(productId);
    } catch (e) {
      log("Error adding to favorites: $e");
      throw Exception("Xəta baş verdi");
    }
  }

  @override
  Future<void> removeFromFavorites(int productId) async {
    try {
      await _favoriteService.removeFromFavorites(productId);
    } catch (e) {
      log("Error removing from favorites: $e");
      throw Exception("Xəta baş verdi");
    }
  }

  @override
  Future<List<Result>> getFavorites() async {
    try {
      return await _favoriteService.getFavorites();
    } catch (e) {
      log("Error fetching favorites: $e");
      throw Exception("Xəta baş verdi");
    }
  }
}
