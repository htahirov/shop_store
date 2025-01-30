import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_constants.dart';

class CustomVerifyTextFormField extends StatelessWidget {
  CustomVerifyTextFormField({super.key});
  final List<TextEditingController> _controllers =
      List.generate(4, (_) => TextEditingController());

  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(4, (i) {
        return SizedBox(
          width: 65.r,
          height: 65.r,
          child: TextFormField(
            controller: _controllers[i],
            focusNode: _focusNodes[i],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 1,
            onChanged: (value) {
              if (value.isNotEmpty && i < 3) {
                FocusScope.of(context).nextFocus();
              } else if (value.isEmpty && i > 0) {
                FocusScope.of(context).previousFocus();
              } else {}
            },
            decoration: InputDecoration(
              counterStyle: TextStyle(
                fontWeight: FontWeight.w700,
                color: AppColors.titleTextColor,
                fontFamily: AppConstants.fontFamily,
                fontSize: 26,
                height: 26.h / 26.sp,
              ),
              counterText: "",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ),
        );
      }),
    );
  }
}
