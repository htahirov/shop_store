import 'package:flutter/material.dart';

import '../../../../utils/constants/app_texts.dart';
import '../../../widgets/custom_input.dart';

class CardNumberInput extends StatelessWidget {
  const CardNumberInput({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return CustomInput(
      controller: controller,
      title: AppTexts.cardNumber,
      keyboardType: TextInputType.number,
      validator: (text) {
        if (text == null || text.isEmpty) {
          return 'Card number is required';
        } else if (text.replaceAll(RegExp(r'\D'), '').length != 16) {
          return 'The card number must be 16 digits.';
        }
        return null;
      },
      onChanged: (text) {
        if (text.replaceAll(RegExp(r'\D'), '').length <= 16) {
          String formattedText = _formatCardNumber(text);
          if (formattedText != text) {
            controller.value = controller.value.copyWith(
              text: formattedText,
              selection: TextSelection.collapsed(offset: formattedText.length),
            );
          }
        }
      },
    );
  }

  String _formatCardNumber(String text) {
    String digits = text.replaceAll(RegExp(r'\D'), '');
    StringBuffer formatted = StringBuffer();
    for (int i = 0; i < digits.length; i++) {
      if (i > 0 && i % 4 == 0) {
        formatted.write(' ');
      }
      formatted.write(digits[i]);
    }
    return formatted.toString();
  }
}
