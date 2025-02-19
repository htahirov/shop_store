import '../models/remote/response/product_response.dart';

abstract class FavoriteRepository {
  Future<void> addToFavorites(int productId);
  Future<void> removeFromFavorites(int productId);
  Future<List<Result>> getFavorites();
}
