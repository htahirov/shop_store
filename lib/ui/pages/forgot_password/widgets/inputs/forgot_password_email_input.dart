import 'package:flutter/material.dart';

import '../../../../../utils/constants/app_texts.dart';
import '../../../../../utils/validator.dart';
import '../../../../widgets/custom_input.dart';

class ForgotPasswordEmailInput extends StatelessWidget {
  const ForgotPasswordEmailInput({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    return CustomInput(
      title: AppTexts.email,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: ValidatorUtils.validateEmail,
    );
  }
}
