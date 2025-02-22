import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_store/utils/screen/snackbars.dart';

import '../../../../cubits/profile/profile_cubit.dart';
import '../../../../utils/enums/gender_enum.dart';
import '../../../widgets/custom_input.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    final profileCubit = context.read<ProfileCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: profileCubit.firstNameController,
          decoration: InputDecoration(
            labelText: "First Name",
            prefixIcon: const Icon(Icons.person),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        12.verticalSpace,
        TextField(
          controller: profileCubit.lastNameController,
          decoration: InputDecoration(
            labelText: "Last Name",
            prefixIcon: const Icon(Icons.person_outline),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        12.verticalSpace,
        TextField(
          readOnly: true,
          decoration: InputDecoration(
            labelText: "Email Address",
            prefixIcon: const Icon(Icons.email),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
          controller: profileCubit.emailController,
        ),
        12.verticalSpace,
        CustomInput.date(
          title: 'Birthday',
          controller: profileCubit.birthdayController,
        ),
        12.verticalSpace,
        TextField(
          controller: profileCubit.bioController,
          decoration: InputDecoration(
            labelText: "Bio",
            prefixIcon: const Icon(Icons.edit),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
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
                            ? Colors.green[200]
                            : Colors.grey[200],
                      ),
                      child: const Text("Male"),
                    ),
                  ),
                  8.horizontalSpace,
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => profileCubit
                          .selectedGenderNotifier.value = Gender.female,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedGender == Gender.female
                            ? Colors.green[200]
                            : Colors.grey[200],
                      ),
                      child: const Text("Female"),
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
              if (ProfileState.success == state) {
                Snackbars.showSuccess(
                  context,
                  message: 'Updated profile successfully!',
                );
              }
            },
            builder: (context, state) => ElevatedButton(
              onPressed: ProfileState.loading == state
                  ? null
                  : () => profileCubit.saveProfile(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[200],
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child:
                  const Text("Update Profile", style: TextStyle(fontSize: 16)),
            ),
          ),
        ),
      ],
    );
  }
}
