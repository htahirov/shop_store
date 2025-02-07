import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/app_paddings.dart';
import '../../../utils/constants/app_texts.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_fab_button.dart';
import 'widgets/inputs/confirm_password.input.dart';
import 'widgets/inputs/new_password_input.dart';

class CreateNewPasswordPage extends StatelessWidget {
  const CreateNewPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: AppTexts.newPassword),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: 1.sh -
                kToolbarHeight -
                ScreenUtil().bottomBarHeight -
                ScreenUtil().statusBarHeight,
          ),
          child: IntrinsicHeight(
            child: Padding(
              padding: AppPaddings.h40,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  40.verticalSpace,
                  Text(
                    AppTexts.createNewPasswordText,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  40.verticalSpace,
                  const NewPasswordInput(),
                  20.verticalSpace,
                  const ConfirmPasswordInput(),
                  const Spacer(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: CustomFabButton(onPressed: () {})),
                  55.verticalSpace,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
