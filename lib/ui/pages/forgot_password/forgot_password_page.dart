import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/app_paddings.dart';
import '../../../utils/constants/app_text_styles.dart';
import '../../../utils/constants/app_texts.dart';
import '../../../utils/helpers/go.dart';
import '../../../utils/helpers/pager.dart';
import '../../../utils/validator.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_fab_button.dart';
import '../../widgets/custom_input.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppTexts.forgotPassword,
        onLeadingPressed: () {
          Go.replace(context, Pager.splash);
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: IntrinsicHeight(
            child: Padding(
              padding: AppPaddings.h40,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppTexts.forgotPasswordText,
                    style: AppTextStyles.verifyTextStyle.copyWith(),
                  ),
                  40.verticalSpace,
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomInput(
                          title: AppTexts.email,
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: ValidatorUtils.validateEmail,
                        ),
                      ],
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
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CustomFabButton(
                                onPressed: () {
                                  if (_formKey.currentState?.validate() ?? false) {
                                    print('Sign in successful');
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Please check your email and password'),
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