import 'package:flutter/material.dart';

import '../../widgets/custom_app_bar.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Create an Account',
      ),
    );
  }
}
