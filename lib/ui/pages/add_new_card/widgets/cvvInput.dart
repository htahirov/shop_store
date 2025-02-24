import 'package:flutter/material.dart';
import 'package:shop_store/ui/widgets/custom_input.dart';

import '../../../../utils/constants/app_texts.dart';

class CvvInput extends StatelessWidget {
  const CvvInput({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return  CustomInput(
      controller: controller,
      title: AppTexts.cvv,
      keyboardType: TextInputType.number,
      validator: (text) {
        if (text == null || text.isEmpty) {
          return 'CVV number required';
        } else if (text.replaceAll(RegExp(r'\D'), '').length != 3) {
          return 'CVV must be 3 digits.';
        }
        return null;
      },
       onChanged: (text) {
        if (text.length > 3) {
          controller.value = controller.value.copyWith(
            text: text.substring(0, 3),
            selection: const TextSelection.collapsed(offset: 3),
          );
        }
      },
    );
  }
}