import 'package:flutter/material.dart';
import 'package:shop_store/ui/widgets/custom_app_bar.dart';
import 'package:shop_store/utils/helpers/go.dart';
import 'package:shop_store/utils/helpers/pager.dart';

import '../../../utils/constants/app_assets.dart';
import 'widgets/profile_form.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Edit Account",
        leadIcon: AppAssets.arrowLeft,
        onLeadingPressed: () => Go.replace(context, Pager.home),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: ProfileForm(),
      ),
    );
  }
}
