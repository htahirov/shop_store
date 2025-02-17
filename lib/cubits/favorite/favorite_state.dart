part of 'favorite_cubit.dart';

@immutable
sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

final class FavoriteLoading extends FavoriteState {}

final class FavoriteSuccess extends FavoriteState {
  final List<Result> favorites;

  FavoriteSuccess(this.favorites);
}

final class FavoriteError extends FavoriteState {
  final String message;

  FavoriteError(this.message);
}

final class FavoriteNetworkError extends FavoriteState {
  final String message;

  FavoriteNetworkError(this.message);
}
