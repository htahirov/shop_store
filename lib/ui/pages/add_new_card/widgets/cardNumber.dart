import 'package:flutter/material.dart';

import '../../../../utils/constants/app_texts.dart';
import '../../../widgets/custom_flexible_input.dart';

class CardNumberInput extends StatelessWidget {
  const CardNumberInput({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFlexibleInput.large(
      controller: TextEditingController(),
      label: AppTexts.cardNumber,
    );
  }
}
