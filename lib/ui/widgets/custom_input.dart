import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants/app_colors.dart';
import '../../utils/constants/app_constants.dart';
import '../../utils/extensions/date_time_extensions.dart';
import '../../utils/helpers/password_condition_indicator.dart';
import '../../utils/models/password_validation.dart';

class CustomInput extends StatefulWidget {
  const CustomInput({
    super.key,
    this.title,
    this.controller,
    this.isObsecure = false,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.showPasswordConditions = false,
    this.isPassword = false,
    this.maxLines = 1,
  }) : isDate = false;

  const CustomInput.date({
    super.key,
    this.title,
    this.controller,
    this.isObsecure = false,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.showPasswordConditions = false,
    this.isPassword = false,
    this.maxLines,
  }) : isDate = true;

  final int? maxLines;
  final String? title;
  final TextEditingController? controller;
  final bool isObsecure;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool showPasswordConditions;
  final bool isPassword;
  final bool isDate;

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  DateTime? selectedDate;

  PasswordValidationState _getPasswordValidationState(String value) {
    return PasswordValidationState(
      hasMinLength: value.length >= 8,
      hasUppercase: value.contains(RegExp(r'[A-Z]')),
      hasLowercase: value.contains(RegExp(r'[a-z]')),
      hasNumber: value.contains(RegExp(r'[0-9]')),
      hasSpecialChar: value.contains(RegExp(r'[!@#\$&*~]')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          Text(
            widget.title!,
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.titleTextColor,
              fontWeight: FontWeight.w600,
              fontFamily: AppConstants.fontFamilyNunito,
              height: 19.h / 14.sp,
              letterSpacing: -0.5,
            ),
          ),
        15.verticalSpace,
        TextFormField(
          maxLines: widget.maxLines,
          controller: widget.controller,
          obscureText: widget.isObsecure,
          obscuringCharacter: '⬤',
          keyboardType: widget.keyboardType,
          onTap: widget.isDate ? () => _selectDate(context) : null,
          readOnly: widget.isDate,
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColors.inputTextColor,
            fontWeight: FontWeight.w400,
            fontFamily: AppConstants.fontFamilyNunito,
            height: 22.h / 14.sp,
            letterSpacing: widget.isObsecure ? 10 : -0.5,
          ),
          validator: widget.validator,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            fillColor: AppColors.inputFillColor,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            suffixIcon: widget.isDate
                ? IconButton(
                    onPressed: () => _selectDate(context),
                    icon: const Icon(Icons.date_range),
                  )
                : null,
          ),
        ),
        if (widget.isPassword && widget.controller != null)
          ValueListenableBuilder<TextEditingValue>(
            valueListenable: widget.controller!,
            builder: (context, value, child) {
              if (value.text.isEmpty) return const SizedBox.shrink();
              final validationState = _getPasswordValidationState(value.text);
              // sertler duzdurse conditionlari gizletmek
              if (validationState.isValid) return const SizedBox.shrink();
              return PasswordConditionIndicator(
                conditions: validationState.conditions,
              );
            },
          ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        widget.controller?.text = selectedDate.formatDate;
      });
    }
  }
}
