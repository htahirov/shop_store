import 'package:flutter/material.dart';

import '../../../../utils/constants/app_texts.dart';
import '../../../widgets/custom_flexible_input.dart';

class CardNumberInput extends StatelessWidget {
  const CardNumberInput({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return CustomFlexibleInput.large(
      controller: controller,
      label: AppTexts.cardNumber,
      keyboardType: TextInputType.number,
      validator: (text) {
        if (text == null || text.isEmpty) {
          return 'Kart nömrəsi boş saxlanıla bilməz';
        } else if (text.replaceAll(RegExp(r'\D'), '').length != 16) {
          return 'Kart nömrəsi 16 rəqəm olmalıdır.Zəhmət olmasa düzgün daxil edin';
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
