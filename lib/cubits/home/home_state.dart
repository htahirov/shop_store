part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final ProductResponse productResponse;

  HomeSuccess(this.productResponse);
}

final class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}

final class HomeNetworkError extends HomeState {
  final String message;

  HomeNetworkError(this.message);
}
