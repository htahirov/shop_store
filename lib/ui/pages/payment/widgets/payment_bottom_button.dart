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
  final cubit=context.read<PaymentCubit>(); 
    // Check if we have payment cards
    if (cubit.selectedCardId == null) {
      Snackbars.showError(context, message: "Please add a payment method");
      return;
    }
    
    // Show processing message
    Snackbars.showSuccess(context, message: "Processing your order...");
    
    // Create order request
    final orderRequest = OrderCreateRequest(
      total: 0,
      address: "123 Main St, City, Country", // Static address
      shipping: "Standard",
      paymentId: '2',
      promoCode: null,
    );
    
    // Create the order
    // await context.read<OrderCubit>().createOrder(orderRequest);
    
    // First navigate to main page
    Go.replace(context, Pager.order);
    
    
  } catch (e) {
    // Show error
    Snackbars.showError(context, message: "Failed to place order: $e");
  }
}
}