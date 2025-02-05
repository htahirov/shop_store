import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'new_password_state.dart';

class NewPasswordCubit extends Cubit<NewPasswordState> {
  NewPasswordCubit() : super(NewPasswordInitial());

  Future<void> forgotPassword({
    required String password,
    required String newPassword,
  }) async {
    try {
      emit(NewPasswordLoading());
      await Future.delayed(const Duration(seconds: 2));
      emit(NewPasswordSuccess());
    } catch (e) {
      emit(NewPasswordError(e.toString()));
    }
  }
}