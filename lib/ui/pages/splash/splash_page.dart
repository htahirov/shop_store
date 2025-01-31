import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/constants/app_assets.dart';
import '../../../utils/constants/app_paddings.dart';


class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      // Go.replace(context, Pager.onboard);
    });
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          AppAssets.logo,
          width: 200,
          height: 200,
        ),
      ),
      floatingActionButton: const Padding(
        padding: AppPaddings.a32,
        child: CircularProgressIndicator(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
