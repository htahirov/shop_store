import 'package:flutter/material.dart';

import '../../../../utils/constants/app_texts.dart';
import '../../../widgets/custom_flexible_input.dart';

class CvvInput extends StatelessWidget {
  const CvvInput({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return  CustomFlexibleInput.medium(
      controller: controller,
      label: AppTexts.cvv,
      keyboardType: TextInputType.number,
      validator: (text) {
        if (text == null || text.isEmpty) {
          return 'CVV nömrəsi boş saxlanıla bilməz';
        } else if (text.replaceAll(RegExp(r'\D'), '').length != 3) {
          return 'CVV 3 rəqəm olmalıdır.Zəhmət olmasa düzgün daxil edin';
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