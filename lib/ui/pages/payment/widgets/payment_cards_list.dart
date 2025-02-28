import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../cubits/payment/payment_cubit.dart';
import '../../../../utils/constants/app_assets.dart';
import '../../../../utils/constants/app_paddings.dart';
import '../../../widgets/custom_progress_loading.dart';
import 'payment_card.dart';

class PaymentCardsList extends StatelessWidget {
  const PaymentCardsList({super.key});

  @override
  Widget build(BuildContext context) {
    final paymentCubit = context.read<PaymentCubit>();
    return BlocBuilder<PaymentCubit, PaymentState>(
      builder: (_, state) {
        if (state is PaymentLoading) {
          return const CustomProgressLoading.medium();
        } else if (state is PaymentSuccess) {
          return SizedBox(
            height: 150.h,
            width: 250.w,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.cards.length,
              itemBuilder: (context, index) {
                final paymentCard = state.cards[index];
                final isSelected = state.selectedCardId == paymentCard.id;
                return Padding(
                  padding: AppPaddings.h18,
                  child: GestureDetector(
                    onTap: () => paymentCubit.selectCard(paymentCard.id),
                    child: PaymentCard(
                      cardNumber: paymentCard.number,
                      expiryDate: paymentCard.date,
                      logoPath: AppAssets.master,
                      cardHolderName: paymentCard.name,
                      isSelected: isSelected,
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is PaymentError) {
          return Center(
            child: Text(state.message),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
