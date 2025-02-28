import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../cubits/order/order_cubit.dart';
import '../../../../cubits/payment/payment_cubit.dart';
import '../../../../data/models/remote/request/order_create_request.dart';
import '../../../../utils/constants/app_assets.dart';
import '../../../../utils/constants/app_texts.dart';
import '../../../../utils/helpers/go.dart';
import '../../../../utils/helpers/pager.dart';
import '../../../../utils/screen/snackbars.dart';
import '../../../widgets/custom_nav_bar_button.dart';

class PaymentBottomButton extends StatelessWidget {
  final double totalAmount;

  const PaymentBottomButton({
    super.key,
    this.totalAmount = 339.0, // Default value from PriceDetails
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 20.h),
      child: CustomNavbarButton(
        title: AppTexts.placeOrder,
        onPressed: () => _handlePlaceOrder(context),
        showIcon: true,
        iconPath: AppAssets.arrowRight,
      ),
    );
  }

  void _handlePlaceOrder(BuildContext context) async {
  try {
    // Check if we have payment cards
    final paymentState = context.read<PaymentCubit>().state;
    if (paymentState is! PaymentSuccess || paymentState.cards.isEmpty) {
      Snackbars.showError(context, message: "Please add a payment method");
      return;
    }
    
    // Get the first payment card
    final selectedCard = (paymentState as PaymentSuccess).cards.first;
    
    // Show processing message
    Snackbars.showSuccess(context, message: "Processing your order...");
    
    // Create order request
    final orderRequest = OrderCreateRequest(
      total: totalAmount,
      address: "123 Main St, City, Country", // Static address
      shipping: "Standard",
      paymentId: selectedCard.id.toString(),
      promoCode: null,
    );
    
    // Create the order
    await context.read<OrderCubit>().createOrder(orderRequest);
    
    // First navigate to main page
    Go.replace(context, Pager.main);
    
    // After a short delay, navigate to the order page specifically
    // This ensures the main navigation is established first
    Future.delayed(const Duration(milliseconds: 300), () {
      Go.to(context, Pager.order);
    });
    
  } catch (e) {
    // Show error
    Snackbars.showError(context, message: "Failed to place order: $e");
  }
}
}