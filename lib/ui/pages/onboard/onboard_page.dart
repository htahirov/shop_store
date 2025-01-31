import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/app_paddings.dart';
import '../../../utils/constants/app_texts.dart';
import '../../../utils/helpers/go.dart';
import '../../../utils/helpers/pager.dart';
import 'widgets/onboard_elevated_button.dart';
import 'widgets/onboard_main_text.dart';
import 'widgets/onboard_second_text.dart';
import 'widgets/onboard_text_button.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppPaddings.h40,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const OnboardMainText(),
            50.verticalSpace,
            const OnboardSecondText(),
            100.verticalSpace,
            Row(
              children: [
                OnboardElevatedButton(
                  text: AppTexts.signUp,
                  onPressed: () => Go.replace(context, Pager.signUp),
                ),
                15.horizontalSpace,
                OnboardTextButton(
                  text: AppTexts.signIn,
                  onPressed: () => Go.replace(context, Pager.signIn),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
