import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/constants/app_assets.dart';
import '../../../utils/constants/app_paddings.dart';
import '../../../utils/helpers/go.dart';
import '../../../utils/helpers/pager.dart';
import '../../widgets/custom_progress_loading.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Go.replace(context, Pager.onboard);
    });
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          AppAssets.logo,
          width: 200,
          height: 200,
        ),
      ),
      floatingActionButton: Padding(
        padding: AppPaddings.a32,
        child: CustomProgressLoading.medium(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
