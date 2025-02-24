import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/settings/settings_cubit.dart';
import '../../../utils/constants/app_paddings.dart';

class SettingsPrivacyPolicyPage extends StatelessWidget {
  const SettingsPrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Privacy Policy")),
      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          if (state is SettingsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SettingsError) {
            return Center(child: Text(state.message));
          } else if (state is SettingsLoaded) {
            return Padding(
              padding: AppPaddings.a16,
              child: SingleChildScrollView(
                child: Text(state.privacyPolicy.content),
              ),
            );
          }
          return const Center(child: Text("No data available"));
        },
      ),
    );
  }
}
