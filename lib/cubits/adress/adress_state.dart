part of 'adress_cubit.dart';

@immutable
sealed class AdressState {}

final class AdressInitial extends AdressState {}
final class AdressLoading extends AdressState {}

final class AdressSuccess extends AdressState {
     final List<AddressModel> address;

  AdressSuccess(this.address);
}

final class AdressError extends AdressState {
   final String message;

  AdressError(this.message);
}

final class AdressNetworkError extends AdressState {}

