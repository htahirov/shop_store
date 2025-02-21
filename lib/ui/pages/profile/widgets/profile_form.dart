import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../cubits/profile/profile_cubit.dart';
import '../../../../data/models/remote/response/user_profile.dart';

class ProfileForm extends StatefulWidget {
  final UserProfile? user;
  final String email;

  const ProfileForm({super.key, required this.user, required this.email});

  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final bioController = TextEditingController();
  DateTime? selectedDate;
  Gender? selectedGender;

  @override
  void initState() {
    super.initState();
    if (widget.user != null) {
      firstNameController.text = widget.user!.firstName ?? '';
      lastNameController.text = widget.user!.lastName ?? '';
      bioController.text = widget.user!.bio ?? '';
      selectedDate = widget.user!.dateOfBirth;
      selectedGender = widget.user!.gender;
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void saveProfile() {
    final updatedUser = UserProfile(
      email: widget.email,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      bio: bioController.text,
      dateOfBirth: selectedDate,
      gender: selectedGender,
    );
    context.read<ProfileCubit>().saveUserProfile(updatedUser);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: firstNameController,
          decoration: InputDecoration(
            labelText: "First Name",
            prefixIcon: const Icon(Icons.person),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        12.verticalSpace,
        TextField(
          controller: lastNameController,
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
          controller: TextEditingController(text: widget.email),
        ),
        12.verticalSpace,
        GestureDetector(
          onTap: () => _selectDate(context),
          child: AbsorbPointer(
            child: TextField(
              decoration: InputDecoration(
                labelText: "Date of Birth",
                prefixIcon: const Icon(Icons.calendar_today),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              controller: TextEditingController(
                text: selectedDate != null
                    ? DateFormat('yyyy-MM-dd').format(selectedDate!)
                    : '',
              ),
            ),
          ),
        ),
        12.verticalSpace,
        TextField(
          controller: bioController,
          decoration: InputDecoration(
            labelText: "Bio",
            prefixIcon: const Icon(Icons.edit),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () => setState(() => selectedGender = Gender.male),
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
                onPressed: () => setState(() => selectedGender = Gender.female),
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedGender == Gender.female
                      ? Colors.green[200]
                      : Colors.grey[200],
                ),
                child: const Text("Female"),
              ),
            ),
          ],
        ),
        20.verticalSpace,
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: saveProfile,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green[200],
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            child: const Text("Update Profile", style: TextStyle(fontSize: 16)),
          ),
        ),
      ],
    );
  }
}