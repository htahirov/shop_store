import 'package:flutter/material.dart';

import '../../../../utils/constants/app_texts.dart';
import '../../../widgets/custom_flexible_input.dart';

class ExpiresInput extends StatelessWidget {
  const ExpiresInput({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFlexibleInput.medium(
      controller: TextEditingController(),
      label: AppTexts.expires, 
    );
  }
}