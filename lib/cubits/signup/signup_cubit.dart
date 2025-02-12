import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void handleSignUp() async {
    if (!formKey.currentState!.validate()) return;

    try {
      emit(SignUpLoading());
      
      await signUp(
        username: usernameController.text,
        phoneNumber: phoneController.text,
        email: emailController.text,
        password: passwordController.text,
      );
      
      emit(SignUpSuccess());
    } catch (e) {
      emit(SignUpError(e.toString()));
    }
  }

  Future<void> signUp({
    required String username,
    required String phoneNumber,
    required String email,
    required String password,
  }) async {
    // TODO: Implement API call
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Future<void> close() {
    usernameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}