import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/remote/response/user_profile.dart';
import '../../data/services/local/profile_hive_service.dart';

class ProfileCubit extends Cubit<UserProfile?> {
  ProfileCubit() : super(null);

  Future<void> loadUserData(String email) async {
    try {
      final user = await ProfileHiveService.getUser(email);
      emit(user);
    } catch (e,s) {
      emit(null);
      log('Error loading user data: $e');
            log('Error loading user data: $s');

    }
  }

  Future<void> saveUserProfile(UserProfile user) async {
    try {
      await ProfileHiveService.saveUser(user);
      emit(user);
    } catch (e,s) {
      log('Error saving user profile: $e');
            log('Error saving user profile: $s');

    }
  }
}
