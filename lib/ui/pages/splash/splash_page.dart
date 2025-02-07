import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../cubits/splash/splash_cubit.dart';
import '../../../utils/constants/app_assets.dart';
import '../../../utils/constants/app_paddings.dart';
import '../../../utils/helpers/go.dart';
import '../../../utils/helpers/pager.dart';
import '../../widgets/custom_progress_loading.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashEnum>(
      listener: (_, state) {
        if (state == SplashEnum.finish) {
          Go.replace(context, Pager.onboard);
        } else if (state == SplashEnum.authenticated) {
          Go.replace(context, Pager.createNewPassword);
        }
      },
      child: Scaffold(
        body: Center(
          child: SvgPicture.asset(
            AppAssets.logo,
            width: 150.r,
            height: 150.r,
          ),
        ),
        floatingActionButton: const CustomProgressLoading.medium(
          alignment: Alignment.bottomCenter,
          padding: AppPaddings.b24,
        ),
      ),
    );
  }
}
