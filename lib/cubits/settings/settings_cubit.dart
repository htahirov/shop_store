import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/remote/response/settings_privacy_policy_response.dart';
import '../../data/repo/settings_privacy_policy_repo.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SettingsPrivacyPolicyRepo _repo;

  SettingsCubit(this._repo) : super(SettingsInitial());

  Future<void> fetchPrivacyPolicy() async {
    emit(SettingsLoading());
    try {
      final policy = await _repo.getPrivacyPolicy();
      emit(SettingsLoaded(policy));
    } catch (e, s) {
      log('$e');
      log('$s');
      if (e.toString().contains("No Internet")) {
        emit(SettingsNetworkError("No Internet Connection"));
      } else {
        emit(SettingsError("Failed to load privacy policy"));
      }
    }
  }
}
