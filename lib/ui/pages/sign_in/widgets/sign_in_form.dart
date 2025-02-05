import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../cubits/signin/signin_cubit.dart';
import 'inputs/sign_in_email_input.dart';
import 'inputs/sign_in_password_input.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    final signInCubit = context.read<SignInCubit>();
    return Form(
      key: signInCubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SignInEmailInput(),
          20.verticalSpace,
          const SignInPasswordInput(),
        ],
      ),
    );
  }
}
