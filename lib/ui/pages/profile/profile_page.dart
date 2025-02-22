import 'package:flutter/material.dart';

import 'widgets/profile_form.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: ProfileForm(),
      ),
    );
  }
}
