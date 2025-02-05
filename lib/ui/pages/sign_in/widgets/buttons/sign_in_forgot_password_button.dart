import 'package:flutter/material.dart';

import '../../../../../utils/constants/app_texts.dart';
import '../../../../widgets/custom_text_button.dart';

class SignInForgotPasswordButton extends StatelessWidget {
  const SignInForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomTextButton(
        text: AppTexts.forgotPassword,
        onPressed: () {},
      ),
    );
  }
}
