import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubits/signup/signup_cubit.dart';
import 'signup_page.dart';

mixin SignUpPageMixin on State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void handleSignUp() {
    if (formKey.currentState?.validate() ?? false) {
      context.read<SignUpCubit>().signUp(
            username: usernameController.text,
            phoneNumber: phoneController.text,
            email: emailController.text,
            password: passwordController.text,
          );
    }
  }
}