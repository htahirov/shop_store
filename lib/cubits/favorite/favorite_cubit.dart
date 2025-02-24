import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/remote/response/product_response.dart';
import '../../data/repo/favorite_repo.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepository _favoriteRepository;

  FavoriteCubit(this._favoriteRepository) : super(FavoriteInitial());

  List<Result> _favorites = [];
  bool wasFavoriteUpdated = false;

  Future<void> fetchFavorites() async {
    emit(FavoriteLoading());
    try {
      List<Result> fetchedFavorites = await _favoriteRepository.getFavorites();

      for (var fav in _favorites) {
        if (!fetchedFavorites.any((serverFav) => serverFav.id == fav.id)) {
          fetchedFavorites.add(fav);
        }
      }

      _favorites = List.from(fetchedFavorites);
      emit(FavoriteSuccess(List.from(_favorites)));
    } catch (e) {
      emit(FavoriteError("Xəta baş verdi"));
    }
  }

  Future<void> toggleFavorite(Result product) async {
    try {
      final isAlreadyFavorite = _favorites.any((p) => p.id == product.id);

      if (isAlreadyFavorite) {
        _favorites.removeWhere((p) => p.id == product.id);
      } else {
        await _favoriteRepository.addToFavorites(product.id!);
        _favorites.add(product);
      }

      wasFavoriteUpdated = true;
      emit(FavoriteSuccess(List.from(_favorites)));
    } catch (e) {
      emit(FavoriteError("Xəta baş verdi"));
    }
  }

  bool isFavorite(int? productId) {
    if (productId == null) return false;
    return _favorites.any((p) => p.id == productId);
  }
}
