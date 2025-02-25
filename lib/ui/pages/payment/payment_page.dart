import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/app_paddings.dart';
import '../../../utils/constants/app_texts.dart';
import '../../../utils/helpers/go.dart';
import '../../../utils/helpers/pager.dart';
import '../../widgets/custom_add_button.dart';
import '../../widgets/custom_nav_bar.dart';
import '../cart/widgets/cart_steps_indicator.dart';
import 'widgets/accepted_payment_method.dart';
import 'widgets/payment_cards_list.dart';
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
                  CustomAddButton(
                    onPressed: () => Go.to(context, Pager.addNewCard),
                  ),
                  18.horizontalSpace,
                  const PaymentCardsList()
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
      // bottomNavigationBar: CustomNavbar(
      //   showButton: true,
      //   showIcon: true,
      //   buttonTitle: AppTexts.placeOrder,
      //   onButtonPressed: () {},
      // ),
    );
  }
}
