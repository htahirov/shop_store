import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants/app_texts.dart';
import '../../../widgets/custom_flexible_input.dart';

class CvvInput extends StatelessWidget {
  const CvvInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(AppTexts.cvv),
        15.verticalSpace,
        CustomFlexibleInput.medium(controller: TextEditingController()),
      ],
    );
  }
}