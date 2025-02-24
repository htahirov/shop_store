import 'package:flutter/material.dart';

import '../../../../utils/constants/app_texts.dart';
import '../../../widgets/custom_input.dart';

class ExpiresInput extends StatelessWidget {
  const ExpiresInput({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return CustomInput(
      controller: controller,
      title: AppTexts.expires,
      keyboardType: TextInputType.number,
      validator: (text) {
        if (text == null || text.isEmpty) {
          return 'Expire date required';
        }

        String digits = text.replaceAll(RegExp(r'\D'), '');

        if (digits.length != 4) {
          return 'Please enter the correct date format. (MM/YY)';
        }

        int month = int.tryParse(digits.substring(0, 2)) ?? 0;
        if (month < 1 || month > 12) {
          return 'Month value must be between 01-12';
        }

        return null;
      },
      onChanged: (text) {
        String formattedText = _formatExpiryDate(text);
        if (formattedText != text) {
          controller.value = controller.value.copyWith(
            text: formattedText,
            selection: TextSelection.collapsed(offset: formattedText.length),
          );
        }
      },
    );
  }

  String _formatExpiryDate(String text) {
    String digits = text.replaceAll(RegExp(r'\D'), '');

    if (digits.length > 4) {
      digits = digits.substring(0, 4);
    }

    if (digits.length >= 2) {
      return '${digits.substring(0, 2)}/${digits.substring(2)}';
    }

    return digits;
  }
}
