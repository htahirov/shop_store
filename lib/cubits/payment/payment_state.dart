part of 'payment_cubit.dart';

@immutable
sealed class PaymentState {}

final class PaymentInitial extends PaymentState {}

final class PaymentLoading extends PaymentState {}

final class PaymentSuccess extends PaymentState {
  final List<PaymentCardModel> cards;

  PaymentSuccess(this.cards);
}

final class PaymentError extends PaymentState {
  final String message;

  PaymentError(this.message);
}

final class PaymentNetworkError extends PaymentState {}
