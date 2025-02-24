import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../cubits/signup/signup_cubit.dart';
import '../../../../utils/constants/app_texts.dart';
import '../../../../utils/validator.dart';
import '../../../widgets/custom_input.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpCubit = context.read<SignUpCubit>();
    return Form(
      key: signUpCubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomInput(
            title: AppTexts.username,
            controller: signUpCubit.usernameController,
            validator: ValidatorUtils.validateUsername,
          ),
          20.verticalSpace,
          CustomInput(
            title: AppTexts.phoneNumber,
            controller: signUpCubit.phoneController,
            keyboardType: TextInputType.phone,
            validator: ValidatorUtils.validatePhoneNumber,
          ),
          20.verticalSpace,
          CustomInput(
            title: AppTexts.email,
            controller: signUpCubit.emailController,
            keyboardType: TextInputType.emailAddress,
            validator: ValidatorUtils.validateEmail,
          ),
          20.verticalSpace,
          CustomInput(
            title: AppTexts.password,
            controller: signUpCubit.passwordController,
            isObsecure: true,
            validator: ValidatorUtils.validatePassword,
            isPassword: true,
          ),
           CustomInput(
            title: AppTexts.confirmPassword,
            controller: signUpCubit.confirmPasswordController,
            isObsecure: true,
            validator: ValidatorUtils.validatePassword,
            isPassword: true,
          ),
        ],
      ),
    );
  }
}
