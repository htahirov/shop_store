import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signin_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      emit(SignInLoading());
      
      
      await Future.delayed(const Duration(seconds: 2));
      
      // API elave etmek ucun yer
      
      emit(SignInSuccess());
    } catch (e) {
      emit(SignInError(e.toString()));
    }
  }
}