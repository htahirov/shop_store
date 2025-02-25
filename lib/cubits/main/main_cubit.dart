import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_state.dart';

class MainCubit extends Cubit<int> {
  MainCubit() : super(0);

  void changeTab(int i) => emit(i);
}
