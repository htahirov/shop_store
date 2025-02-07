import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'new_password_state.dart';

class NewPasswordCubit extends Cubit<NewPasswordState> {
  NewPasswordCubit() : super(NewPasswordInitial());

  final formKey = GlobalKey<FormState>();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void handleNewPassword() async {
    if (!formKey.currentState!.validate()) return;
    await _changePassword();
  }

  Future<void> _changePassword() async {
    try {
      emit(NewPasswordLoading());
      await Future.delayed(const Duration(seconds: 2));
      emit(NewPasswordSuccess());
    } catch (e) {
      emit(NewPasswordError("An unexpected error occurred"));
    }
  }

  @override
  Future<void> close() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}
