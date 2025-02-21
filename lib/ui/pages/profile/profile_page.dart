import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../cubits/profile/profile_cubit.dart';
import '../../../data/models/remote/response/user_profile.dart';
import 'widgets/profile_form.dart';

class ProfilePage extends StatefulWidget {
  final String email;

  const ProfilePage({super.key, required this.email});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().loadUserData(widget.email);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, UserProfile?>(
      builder: (context, user) {
        return Scaffold(
          appBar: AppBar(title: const Text("Profile")),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: ProfileForm(user: user, email: widget.email),
          ),
        );
      },
    );
  }
}


