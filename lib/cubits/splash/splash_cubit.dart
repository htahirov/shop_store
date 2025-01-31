import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/constants/app_durations.dart';

enum SplashEnum { start, finish }

class SplashCubit extends Cubit<SplashEnum> {
  SplashCubit() : super(SplashEnum.start);

  void startApp() async {
    await Future.delayed(AppDurations.s2);
    emit(SplashEnum.finish);
  }
}
