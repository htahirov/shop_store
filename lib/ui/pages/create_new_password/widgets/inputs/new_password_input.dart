import 'package:flutter/material.dart';

import '../../../../../utils/constants/app_texts.dart';
import '../../../../../utils/validator.dart';
import '../../../../widgets/custom_input.dart';

class NewPasswordInput extends StatelessWidget {
  const NewPasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    final newPasswordController = TextEditingController();
    return CustomInput(
      title: AppTexts.createNewPassword,
      controller: newPasswordController,
      keyboardType: TextInputType.visiblePassword,
      validator: ValidatorUtils.validateCreateNewPassword,
    );
  }
}
