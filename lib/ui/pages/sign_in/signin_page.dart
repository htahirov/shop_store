import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../cubits/signin/signin_cubit.dart';
import '../../../utils/constants/app_paddings.dart';
import '../../../utils/constants/app_texts.dart';
import '../../../utils/helpers/go.dart';
import '../../../utils/helpers/pager.dart';
import '../../../utils/screen/snackbars.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_fab_button.dart';
import '../../widgets/custom_text_button.dart';
import 'widgets/buttons/sign_in_forgot_password_button.dart';
import 'widgets/sign_in_form.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final signInCubit = context.read<SignInCubit>();
    return Scaffold(
      appBar: const CustomAppBar(title: AppTexts.signIn),
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
                  const SignInForm(),
                  15.verticalSpace,
                  const SignInForgotPasswordButton(),
                  const Spacer(),
                  SizedBox(
                    height: 89.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextButton(
                          text: AppTexts.signUp,
                          onPressed: () => Go.to(context, Pager.signUp),
                        ),
                        BlocConsumer<SignInCubit, SignInState>(
                          listener: (_, state) {
                            if (state is SignInSuccess) {
                              Go.replace(context, Pager.home);
                            } else if (state is SignInError) {
                              Snackbars.showError(context);
                            } else if (state is SignInNetworkError) {
                              Snackbars.showNetworkError(context);
                            }
                          },
                          builder: (_, state) => CustomFabButton(
                            isLoading: state is SignInLoading,
                            onPressed: signInCubit.handleSignIn,
                          ),
                        ),
                      ],
                    ),
                  ),
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
