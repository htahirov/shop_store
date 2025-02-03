import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubits/signin/signin_cubit.dart';
import 'signin_page.dart';

mixin SignInPageMixin on State<SignInPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void handleSignIn() {
    if (formKey.currentState?.validate() ?? false) {
      context.read<SignInCubit>().signIn(
            email: emailController.text,
            password: passwordController.text,
          );
    }
  }
}