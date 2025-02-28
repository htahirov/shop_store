import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../cubits/payment/payment_cubit.dart';
import '../../../../utils/constants/app_assets.dart';
import '../../../../utils/constants/app_texts.dart';
import '../../../../utils/helpers/go.dart';
import '../../../../utils/helpers/pager.dart';
import '../../../../utils/screen/snackbars.dart';
import '../../../widgets/custom_nav_bar_button.dart';

class SaveCardButton extends StatelessWidget {
  const SaveCardButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 20.h),
      child: CustomNavbarButton(
        title: AppTexts.save,
        onPressed: () => _handleSaveCard(context),
        showIcon: true,
        iconPath: AppAssets.arrowRight,
      ),
    );
  }

  void _handleSaveCard(BuildContext context) async {
    try {
      final paymentCubit = context.read<PaymentCubit>();
      
      // Attempt to save the payment data
      await paymentCubit.savePaymentData();
      
      // Show success message
      Snackbars.showSuccess(context, message: "Card saved successfully");
      
      // Navigate back to payment page
      Go.replace(context, Pager.payment);
      
    } catch (e) {
      // Show error message
      Snackbars.showError(context, message: "Failed to save card: $e");
    }
  }
}