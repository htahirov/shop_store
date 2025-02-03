import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../cubits/signup/signup_cubit.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_constants.dart';
import '../../../utils/constants/app_paddings.dart';
import '../../../utils/constants/app_texts.dart';
import '../../../utils/helpers/go.dart';
import '../../../utils/helpers/pager.dart';
import '../../../utils/validator.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_fab_button.dart';
import '../../widgets/custom_input.dart';
import '../../widgets/custom_progress_loading.dart';
import '../../widgets/custom_text_button.dart';
import 'signup_page_mixin.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with SignUpPageMixin {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          Go.to(context, Pager.verify);
        } else if (state is SignUpError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: AppTexts.signUp,
          onLeadingPressed: () => Go.replace(context, Pager.signIn),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: AppPaddings.h40,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      40.verticalSpace,
                      Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomInput(
                              title: AppTexts.username,
                              controller: usernameController,
                              validator: ValidatorUtils.validateUsername,
                            ),
                            20.verticalSpace,
                            CustomInput(
                              title: AppTexts.phoneNumber,
                              controller: phoneController,
                              keyboardType: TextInputType.phone,
                              validator: ValidatorUtils.validatePhoneNumber,
                            ),
                            20.verticalSpace,
                            CustomInput(
                              title: AppTexts.email,
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              validator: ValidatorUtils.validateEmail,
                            ),
                            20.verticalSpace,
                            CustomInput(
                              title: AppTexts.password,
                              controller: passwordController,
                              isObsecure: true,
                              validator: ValidatorUtils.validatePassword,
                              isPassword: true,
                            ),
                          ],
                        ),
                      ),
                      30.verticalSpace,
                      Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'By signing up you agree to our\n',
                                style: TextStyle(
                                  fontFamily: AppConstants.fontFamilyNunito,
                                  color: AppColors.textButtonColor,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w200,
                                  letterSpacing: -0.06,
                                  height: 1.5,
                                ),
                              ),
                              TextSpan(
                                text: AppTexts.termsOfService,
                                style: TextStyle(
                                  fontFamily: AppConstants.fontFamilyNunito,
                                  color: AppColors.textButtonColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: -0.07,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      181.verticalSpace,
                      SizedBox(
                        height: 89.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 380.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomTextButton(
                                    text: AppTexts.login,
                                    onPressed: () => Go.to(context, Pager.signIn),
                                  ),
                                  BlocBuilder<SignUpCubit, SignUpState>(
                                    builder: (context, state) {
                                      if (state is SignUpLoading) {
                                        return const CustomProgressLoading.medium();
                                      }
                                      return CustomFabButton(
                                        onPressed: handleSignUp,  
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              BlocBuilder<SignUpCubit, SignUpState>(
                builder: (context, state) {
                  if (state is SignUpLoading) {
                    return Container(
                      color: Colors.black.withOpacity(0.1),
                      child: const Center(
                        child: CustomProgressLoading.large(),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}