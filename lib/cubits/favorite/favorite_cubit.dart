import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/models/remote/response/product_response.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  final List<Result> _favorites = [];

  void toggleFavorite(Result product) {
    emit(FavoriteLoading());
    try {
      if (_favorites.contains(product)) {
        _favorites.remove(product);
      } else {
        _favorites.add(product);
      }

      emit(FavoriteSuccess(_favorites));
    } on SocketException catch (e) {
      emit(FavoriteNetworkError(e.toString()));
    } catch (e) {
      emit(FavoriteError("Xəta baş verdi"));
    }
  }

  bool isFavorite(Result product) {
    return _favorites.contains(product);
  }
}
