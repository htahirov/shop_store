import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../cubits/signin/signin_cubit.dart';
import '../../../utils/constants/app_paddings.dart';
import '../../../utils/constants/app_texts.dart';
import '../../../utils/helpers/go.dart';
import '../../../utils/helpers/pager.dart';
import '../../../utils/validator.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_input.dart';
import '../../widgets/custom_progress_loading.dart';
import '../../widgets/custom_text_button.dart';
import '../../widgets/custom_fab_button.dart';
import 'signin_page_mixin.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> with SignInPageMixin {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          Go.to(context, Pager.verify);
        } else if (state is SignInError) {
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
          title: AppTexts.signIn,
          onLeadingPressed: () {
            Go.replace(context, Pager.splash);
          },
        ),
        body: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: IntrinsicHeight(
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
                        15.verticalSpace,
                        Center(
                          child: CustomTextButton(
                            text: AppTexts.forgotPassword,
                            onPressed: () {
                              // passwordu unutmaq
                            },
                          ),
                        ),
                        396.verticalSpace,
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
                                      text: AppTexts.signUp,
                                      onPressed: () {
                                        Go.to(context, Pager.signUp);
                                      },
                                    ),
                                    BlocBuilder<SignInCubit, SignInState>(
                                      builder: (context, state) {
                                        if (state is SignInLoading) {
                                          return const CustomProgressLoading.medium();
                                        }
                                        return CustomFabButton(
                                          onPressed: handleSignIn,
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
              ),
              BlocBuilder<SignInCubit, SignInState>(
                builder: (context, state) {
                  if (state is SignInLoading) {
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