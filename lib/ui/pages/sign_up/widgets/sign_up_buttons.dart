import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../cubits/signup/signup_cubit.dart';
import '../../../../utils/constants/app_texts.dart';
import '../../../../utils/helpers/go.dart';
import '../../../../utils/helpers/pager.dart';
import '../../../widgets/custom_fab_button.dart';
import '../../../widgets/custom_text_button.dart';

class SignUpButtons extends StatelessWidget {
  const SignUpButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpCubit = context.read<SignUpCubit>();
    return SizedBox(
      height: 89.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextButton(
            text: AppTexts.login,
            onPressed: () => Go.to(context, Pager.signIn),
          ),
          BlocBuilder<SignUpCubit, SignUpState>(
            builder: (context, state) {
              return CustomFabButton(
                isLoading: state is SignUpLoading,
                onPressed: () => signUpCubit.handleSignUp(),
              );
            },
          ),
        ],
      ),
    );
  }
}