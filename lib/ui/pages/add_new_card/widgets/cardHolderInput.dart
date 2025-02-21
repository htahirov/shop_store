import 'package:flutter/material.dart';

import '../../../../utils/constants/app_texts.dart';
import '../../../widgets/custom_flexible_input.dart';

class CardHolderNameInput extends StatelessWidget {
  const CardHolderNameInput({super.key,required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return CustomFlexibleInput.large(
      label: AppTexts.cardHolderName,
      controller: controller,
      keyboardType: TextInputType.text,
    );
  }
}
