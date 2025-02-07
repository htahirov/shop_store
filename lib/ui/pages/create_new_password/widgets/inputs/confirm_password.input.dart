import 'package:flutter/material.dart';

import '../../../../../utils/constants/app_texts.dart';
import '../../../../../utils/validator.dart';
import '../../../../widgets/custom_input.dart';

class ConfirmPasswordInput extends StatelessWidget {
  const ConfirmPasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    final newPasswordController = TextEditingController();
    return CustomInput(
      title: AppTexts.newPassword,
      controller: newPasswordController,
      keyboardType: TextInputType.visiblePassword,
      validator: (value) => ValidatorUtils.validateConfirmPassword(
        value,
        newPasswordController.text,
      ),
    );
  }
}
