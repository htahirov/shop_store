import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_store/data/models/remote/response/user_profile.dart';
import '../../data/repo/signup_repo.dart';
import '../../data/models/remote/request/signup_request.dart';
import '../../data/services/local/profile_hive_service.dart';

part 'signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._signUpRepo) : super(SignUpInitial());

  final SignUpRepo _signUpRepo;

  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void handleSignUp(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    try {
      emit(SignUpLoading());

      final request = SignUpRequest(
          username: usernameController.text,
          phoneNumber: phoneController.text,
          email: emailController.text,
          password: passwordController.text,
          passwordConfirm: confirmPasswordController.text);

      final response = await _signUpRepo.signUp(request: request);

      if (response != null) {
        await ProfileHiveService.saveUser(
          UserProfile(email: emailController.text),
        );

        emit(SignUpSuccess());
      } else {
        emit(SignUpError('Sign up failed.'));
      }
    } catch (e, s) {
      log("SignUp error: $e", stackTrace: s);
      emit(SignUpError(e.toString()));
    }
  }

  @override
  Future<void> close() {
    usernameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}
