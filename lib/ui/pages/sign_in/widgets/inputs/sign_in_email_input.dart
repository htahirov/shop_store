import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../cubits/signin/signin_cubit.dart';
import '../../../../../utils/constants/app_texts.dart';
import '../../../../../utils/validator.dart';
import '../../../../widgets/custom_input.dart';

class SignInEmailInput extends StatelessWidget {
  const SignInEmailInput({super.key});

  @override
  Widget build(BuildContext context) {
    final signInCubit = context.read<SignInCubit>();
    return CustomInput(
      title: AppTexts.email,
      controller: signInCubit.emailController,
      keyboardType: TextInputType.emailAddress,
      validator: ValidatorUtils.validateEmail,
    );
  }
}
