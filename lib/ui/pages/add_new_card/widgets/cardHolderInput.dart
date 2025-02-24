import 'package:flutter/material.dart';

import '../../../../utils/constants/app_texts.dart';
import '../../../widgets/custom_input.dart';

class CardHolderNameInput extends StatelessWidget {
  const CardHolderNameInput({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return CustomInput(
      title: AppTexts.cardHolderName,
      controller: controller,
      keyboardType: TextInputType.text,
      validator: (text) {
        if (text == null || text.isEmpty) {
          return 'Cardholder name is required';
        }
        return null;
      },
    );
  }
}
