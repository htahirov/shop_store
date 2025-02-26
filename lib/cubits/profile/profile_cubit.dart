import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/remote/response/user_profile.dart';
import '../../data/services/local/auth_hive_service.dart';
import '../../data/services/local/profile_hive_service.dart';
import '../../utils/enums/gender_enum.dart';

enum ProfileState { initial, loading, success, error }

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState.initial);
  bool isProfileUpdated = false;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final bioController = TextEditingController();
  final emailController = TextEditingController();
  final birthdayController = TextEditingController();

  final selectedGenderNotifier = ValueNotifier<Gender?>(null);

  UserProfile? user;

  Future<void> fillInputs() async {
    if (user != null) {
      firstNameController.text = user!.firstName ?? '';
      emailController.text = user!.email;
      lastNameController.text = user!.lastName ?? '';
      bioController.text = user!.bio ?? '';
      birthdayController.text = user!.dateOfBirth ?? '';
      selectedGenderNotifier.value = Gender.fromText(user!.gender);
    }
  }

  void loadUserData() async {
    try {
      emit(ProfileState.loading);

      user = await ProfileHiveService.getUser();

      if (user != null) {
        fillInputs();
      } else {
        final authUser = await AuthHiveService.getData();
        if (authUser != null) {
          emailController.text = authUser.email;
        }
      }

      emit(ProfileState.success);
    } catch (e, s) {
      emit(ProfileState.error);
      log('Error loading user data: $e');
      log('Error loading user data: $s');
    }
  }

  void saveProfile() async {
    try {
      emit(ProfileState.loading);
      final updatedUser = UserProfile(
        email: emailController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        bio: bioController.text,
        dateOfBirth: birthdayController.text,
        gender: selectedGenderNotifier.value?.name,
      );

      await ProfileHiveService.saveUser(updatedUser);

      emit(ProfileState.success);
    } catch (e) {
      emit(ProfileState.error);
    }
  }

  @override
  Future<void> close() {
    firstNameController.dispose();
    lastNameController.dispose();
    bioController.dispose();
    return super.close();
  }
}
