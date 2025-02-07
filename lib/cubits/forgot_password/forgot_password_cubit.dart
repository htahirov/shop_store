import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(ForgotPasswordInitial());

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  void handleForgotPassword() async {
    if (!formKey.currentState!.validate()) return;
    await _forgotPassword();
  }

  Future<void> _forgotPassword() async {
    try {
      emit(ForgotPasswordLoading());
      await Future.delayed(const Duration(seconds: 2));
      emit(ForgotPasswordSuccess());
    } catch (e) {
      emit(ForgotPasswordError("An unexpected error occurred"));
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    return super.close();
  }
}
