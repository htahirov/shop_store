import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_store/ui/widgets/custom_nav_bar.dart';
import 'widgets/cardNumber.dart';
import 'widgets/cvvInput.dart';
import 'widgets/expiresInput.dart';

import '../../../utils/constants/app_assets.dart';
import '../../../utils/constants/app_paddings.dart';
import '../../../utils/constants/app_text_styles.dart';
import '../../../utils/constants/app_texts.dart';
import '../payment/widgets/payment_card.dart';
import 'widgets/cardHolderInput.dart';

class AddNewCardPage extends StatelessWidget {
  const AddNewCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppPaddings.h40,
          child: Column(
            children: [
              27.verticalSpace,
              Text(
                AppTexts.addNewCard,
                style: AppTextStyles.headerTextStyle,
              ),
              30.verticalSpace,
              const CustomPaymentCard.compact(
                cardNumber: "1234567898765432",
                expiryDate: "12/24",
                logoPath: AppAssets.alipay,
                cardHolderName: "Letita Esthan",
              ),
              30.verticalSpace,
              const CardHolderNameInput(),
              20.verticalSpace,
              const CardNumberInput(),
              Row(
                children: [
                  const ExpiresInput(),
                  15.horizontalSpace,
                  const CvvInput(),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomNavbar(
        showButton: true,
        buttonTitle: AppTexts.save,
      ),
    );
  }
}
