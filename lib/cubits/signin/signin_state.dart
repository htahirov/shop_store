part of 'signin_cubit.dart';

@immutable
abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState {}

class SignInError extends SignInState {
  final String message;

  SignInError(this.message);
}

class SignInNetworkError extends SignInState {
  final String message;

  SignInNetworkError(this.message);
}
