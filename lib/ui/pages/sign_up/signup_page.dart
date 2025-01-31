import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
import '../../widgets/custom_text_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppTexts.signUp,
        onLeadingPressed: () => Go.replace(context, Pager.signIn),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: IntrinsicHeight(
            child: Padding(
              padding: AppPaddings.h40,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  40.verticalSpace,
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomInput(
                          title: AppTexts.username,
                          controller: _usernameController,
                        ),
                        20.verticalSpace,
                        CustomInput(
                          title: AppTexts.phoneNumber,
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                        ),
                        20.verticalSpace,
                        CustomInput(
                          title: AppTexts.email,
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: ValidatorUtils.validateEmail,
                        ),
                        20.verticalSpace,
                        CustomInput(
                          title: AppTexts.password,
                          controller: _passwordController,
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
                                onPressed: () {
                                  Go.to(context, Pager.signIn);
                                },
                              ),
                              CustomFabButton(
                                onPressed: () {
                                  if (_formKey.currentState?.validate() ??
                                      false) {
                                    // sign up zamani process davami etmek lazimdi sehife olanda
                                    print('Sign up successful');
                                  } else {
                                    // xeta mesaji gostermek
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Please check your input fields'),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
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
      ),
    );
  }
}
