import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/constants/app_paddings.dart';
import '../../../utils/constants/app_texts.dart';
import '../../../utils/helpers/go.dart';
import '../../../utils/helpers/pager.dart';
import '../../../utils/validator.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_input.dart';
import '../../widgets/custom_text_button.dart';
import '../../widgets/custom_fab_button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppTexts.signIn,
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
                  15.verticalSpace,
                  Center(
                    child: CustomTextButton(
                      text: AppTexts.forgotPassword,
                      onPressed: () {
                        // forgot passwordu qosmaq lazimdir
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
                              CustomFabButton(
                                onPressed: () {
                                  if (_formKey.currentState?.validate() ?? false) {
                                    // sehife olanda qosmaq laizmidr
                                    print('Sign in successful');
                                  } else {
                                    // xeta mesaji gostermek
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