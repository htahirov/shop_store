import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyCubit extends Cubit<String> {
  VerifyCubit() : super(''); 

  void updateVerificationCode(String code) {
    emit(code); 
  }
}