import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../cubits/signup/signup_cubit.dart';
import '../../../utils/constants/app_paddings.dart';
import '../../../utils/constants/app_texts.dart';
import '../../../utils/helpers/go.dart';
import '../../../utils/helpers/pager.dart';
import '../../widgets/custom_app_bar.dart';
import 'widgets/sign_up_form.dart';
import 'widgets/sign_up_buttons.dart';
import 'widgets/terms_text.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppTexts.signUp,
        onLeadingPressed: () => Go.replace(context, Pager.signIn),
      ),
      body: BlocListener<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            Go.to(context, Pager.verify);
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: AppPaddings.h40,
            child: Column(
              children: [
                40.verticalSpace,
                const SignUpForm(),
                30.verticalSpace,
                const TermsText(),
                181.verticalSpace,
                const SignUpButtons(),
                55.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}