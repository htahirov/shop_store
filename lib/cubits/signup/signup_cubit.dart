import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  Future<void> signUp({
    required String username,
    required String phoneNumber,
    required String email,
    required String password,
  }) async {
    try {
      emit(SignUpLoading());      
     
      await Future.delayed(const Duration(seconds: 2));
      
      // API servis ucun yer
      
      emit(SignUpSuccess());
    } catch (e) {
      emit(SignUpError(e.toString()));
    }
  }
}