import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/remote/request/login_request.dart';
import '../../data/repo/auth_repo.dart';

part 'signin_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this._authRepo) : super(SignInInitial());

  final AuthRepo _authRepo;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void handleSignIn() async {
    if (!formKey.currentState!.validate()) return;
    await _signIn();
  }

  Future<void> _signIn() async {
    try {
      emit(SignInLoading());
      final data = await _authRepo.login(
        request: LoginRequest(
          email: emailController.text,
          password: passwordController.text,
        ),
      );
      emit(SignInSuccess());
    } on DioException catch (e) {
      emit(SignInError('$e'));
    } catch (e, s) {
      emit(SignInError('$e\n$s'));
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
