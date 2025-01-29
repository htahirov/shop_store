import 'package:flutter/material.dart';
import 'package:shop_store/ui/widgets/custom_app_bar.dart';

import '../../widgets/custom_fab_button.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Create an Account',
      ),
      body: Container(),
      floatingActionButton: CustomFabButton(
        onPressed: () {},
      ),
    );
  }
}
