import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/app_assets.dart';
import '../../../utils/constants/app_paddings.dart';
import '../../../utils/constants/app_texts.dart';
import '../../widgets/custom_add_button.dart';
import '../../widgets/custom_nav_bar.dart';
import '../cart/widgets/cart_steps_indicator.dart';
import 'widgets/accepted_payment_method.dart';
import 'widgets/payment_card.dart';
import 'widgets/price_details.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppPaddings.h24,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: CartStepsIndicator('Payments'),
              ),
              30.verticalSpace,
              Row(
                children: [
                  const CustomAddButton(),
                  18.horizontalSpace,
                  const CustomPaymentCard(
                    cardNumber: "1234567898765432",
                    expiryDate: "12/24",
                    logoPath: AppAssets.master,
                    cardHolderName: "Nihad",
                  )
                ],
              ),
              20.verticalSpace,
              const AcceptedPaymentMethod(),
              20.verticalSpace,
              const PriceDetails()
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomNavbar(
        showButton: true,
        showIcon: true,
        buttonTitle: AppTexts.placeOrder,
        onButtonPressed: () {},
      ),
    );
  }
}
