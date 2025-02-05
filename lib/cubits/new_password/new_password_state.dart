part of 'new_password_cubit.dart';



@immutable
abstract class NewPasswordState {}

class NewPasswordInitial extends NewPasswordState {}

class NewPasswordLoading extends NewPasswordState {}

class NewPasswordSuccess extends NewPasswordState {}

class NewPasswordError extends NewPasswordState {
  final String message;

  NewPasswordError(this.message);
}