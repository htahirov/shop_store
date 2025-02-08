import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/services/local/auth_hive_service.dart';
import '../../utils/constants/app_durations.dart';

enum SplashEnum { start, finish, authenticated }

class SplashCubit extends Cubit<SplashEnum> {
  SplashCubit() : super(SplashEnum.start);

  void startApp() async {
    await Future.delayed(AppDurations.s2);
    final data = await AuthHiveService.getData();
    
    if (data?.tokens.access != null) {
      emit(SplashEnum.authenticated);
      return;
    }
    emit(SplashEnum.finish);
  }
}
