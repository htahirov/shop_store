import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_store/ui/widgets/custom_app_bar.dart';
import 'package:shop_store/utils/constants/app_assets.dart';
import 'package:shop_store/utils/helpers/go.dart';

import '../../../cubits/payment/payment_cubit.dart';
import '../../../data/models/local/payment_card_model.dart';
import '../../../utils/constants/app_paddings.dart';
import '../../../utils/constants/app_text_styles.dart';
import '../../../utils/constants/app_texts.dart';
import '../../../utils/helpers/pager.dart';
import '../../widgets/custom_nav_bar.dart';
import 'widgets/cardHolderInput.dart';
import 'widgets/cardNumber.dart';
import 'widgets/card_list.dart';
import 'widgets/cvvInput.dart';
import 'widgets/expiresInput.dart';

class AddNewCardPage extends StatelessWidget {
  const AddNewCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Add New Card",
        leadIcon: AppAssets.arrowLeft,
        onLeadingPressed: () => Go.replace(context,Pager.home),
      ),
      body: SafeArea(
        child: Padding(
          padding: AppPaddings.h40,
          child: Form(
            key: context.read<PaymentCubit>().formKey,
            child: Column(
              children: [
                
                30.verticalSpace,
                const CardList(),
                30.verticalSpace,
                CardHolderNameInput(
                  controller: context.read<PaymentCubit>().cardNameController,
                ),
                20.verticalSpace,
                CardNumberInput(
                  controller: context.read<PaymentCubit>().cardNumberController,
                ),
                20.verticalSpace,
                Row(
                  children: [
                    ExpiresInput(
                      controller:
                          context.read<PaymentCubit>().expiresDateController,
                    ),
                    15.horizontalSpace,
                    CvvInput(
                      controller: context.read<PaymentCubit>().cvvController,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BlocBuilder<PaymentCubit, PaymentState>(
        builder: (context, state) {
          return CustomNavbar(
            showButton: true,
            buttonTitle: AppTexts.save,
            onButtonPressed: () {
              final paymentCard = PaymentCardModel(
                id: DateTime.now().millisecondsSinceEpoch,
                name: context.read<PaymentCubit>().cardNameController.text,
                number: context.read<PaymentCubit>().cardNumberController.text,
                date: context.read<PaymentCubit>().expiresDateController.text,
                code: context.read<PaymentCubit>().cvvController.text,
              );
              context.read<PaymentCubit>().savePaymentData(paymentCard);
            },
          );
        },
      ),
    );
  }
}
