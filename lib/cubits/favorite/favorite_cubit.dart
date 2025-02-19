import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/remote/response/product_response.dart';
import '../../data/repo/favorite_repo.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepository _favoriteRepository;

  FavoriteCubit(this._favoriteRepository) : super(FavoriteInitial());

  List<Result> _favorites = [];

  Future<void> fetchFavorites() async {
    emit(FavoriteLoading());
    try {
      _favorites = await _favoriteRepository.getFavorites();
      emit(FavoriteSuccess(_favorites));
    } catch (e) {
      emit(FavoriteError("Xəta baş verdi"));
    }
  }
  
  Future<void> addToFavorite(Result product) async {
    emit(FavoriteLoading());
    try {
      await _favoriteRepository.addToFavorites(product.id!);
      emit(FavoriteSuccess(_favorites));
    } catch (e) {
      emit(FavoriteError("Xəta baş verdi"));
    }
  }

//   Future<void> toggleFavorite(Result product) async {
//   emit(FavoriteLoading());
//   try {
//     log("Favorite düyməsinə basıldı: ${product.id}");

//     if (_favorites.any((item) => item.id == product.id)) {
//       await _favoriteRepository.removeFromFavorites(product.id!);
//       _favorites.removeWhere((item) => item.id == product.id);
//       log("Məhsul favoritdən çıxarıldı: ${product.id}");
//     } else {
//       await _favoriteRepository.addToFavorites(product.id!);
//       _favorites.add(product);
//       log("Məhsul favoritlərə əlavə olundu: ${product.id}");
//     }

//     emit(FavoriteSuccess(List.from(_favorites)));
//     fetchFavorites();
//   } on SocketException catch (e) {
//     log("Şəbəkə Xətası: $e");
//     emit(FavoriteNetworkError(e.toString()));
//   } catch (e) {
//     log("Xəta: $e");
//     emit(FavoriteError("Xəta baş verdi"));
//   }
// }

  bool isFavorite(Result product) {
    return _favorites.any((item) => item.id == product.id);
  }
}
