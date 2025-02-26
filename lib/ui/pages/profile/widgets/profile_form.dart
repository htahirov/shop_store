import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_store/utils/constants/app_colors.dart';
import 'package:shop_store/utils/screen/snackbars.dart';

import '../../../../cubits/profile/profile_cubit.dart';
import '../../../../utils/enums/gender_enum.dart';
import '../../../widgets/custom_input.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    final profileCubit = context.read<ProfileCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      profileCubit.loadUserData();
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CircleAvatar(
          radius: 65,
          backgroundImage: AssetImage("assets/logo/profile.png"),
        ),
        60.verticalSpace,
        Row(
          children: [
            Expanded(
                child: CustomInput(
              title: "First Name",
              controller: profileCubit.firstNameController,
            )),
            12.horizontalSpace,
            Expanded(
                child: CustomInput(
              title: "Last Name",
              controller: profileCubit.lastNameController,
            )),
          ],
        ),
        12.verticalSpace,
        CustomInput(
          title: "Email",
          controller: profileCubit.emailController,
        ),
        12.verticalSpace,
        CustomInput.date(
          title: 'Date of Birth',
          controller: profileCubit.birthdayController,
        ),
        12.verticalSpace,
        CustomInput(
          title: "Bio",
          controller: profileCubit.bioController,
          maxLines: 3,
        ),
        const SizedBox(height: 12),
        ValueListenableBuilder(
            valueListenable: profileCubit.selectedGenderNotifier,
            builder: (context, selectedGender, __) {
              return Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => profileCubit
                          .selectedGenderNotifier.value = Gender.male,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedGender == Gender.male
                            ? AppColors.primary
                            : AppColors.chefsHat,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text("Male",
                          style: TextStyle(
                              fontSize: 16, color: AppColors.titleTextColor)),
                    ),
                  ),
                  8.horizontalSpace,
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => profileCubit
                          .selectedGenderNotifier.value = Gender.female,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedGender == Gender.female
                            ? AppColors.primary
                            : AppColors.chefsHat,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text("Female",
                          style: TextStyle(
                              fontSize: 16, color: AppColors.titleTextColor)),
                    ),
                  ),
                ],
              );
            }),
        20.verticalSpace,
        SizedBox(
          width: double.infinity,
          child: BlocConsumer<ProfileCubit, ProfileState>(
            listener: (context, state) {
              if (state == ProfileState.success &&
                  profileCubit.isProfileUpdated) {
                profileCubit.isProfileUpdated = false;
                Snackbars.showSuccess(
                  context,
                  message: 'Updated profile successfully!',
                );
              }
            },
            builder: (context, state) => ElevatedButton(
              onPressed: ProfileState.loading == state
                  ? null
                  : () {
                     profileCubit.isProfileUpdated = true;
                     profileCubit.saveProfile();},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text("Update Profile",
                  style:
                      TextStyle(fontSize: 16, color: AppColors.titleTextColor)),
            ),
          ),
        ),
      ],
    );
  }
}
