import 'package:flutter/material.dart';
import 'package:shop_store/utils/constants/app_colors.dart';

class Snackbars {
  Snackbars._();

  static void showError(
    BuildContext context, {
    String message = 'Error Occured',
  }) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );

  static void showSuccess(
    BuildContext context, {
    String message = 'Successful!',
  }) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: AppColors.sea,
        ),
      );

  static void showNetworkError(
    BuildContext context, {
    String message = 'Network Error Occured',
  }) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
}
