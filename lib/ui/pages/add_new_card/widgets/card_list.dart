import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../cubits/payment/payment_cubit.dart';
import '../../../../utils/constants/app_assets.dart';
import '../../../../utils/constants/app_paddings.dart';
import '../../../widgets/custom_progress_loading.dart';
import '../../payment/widgets/payment_card.dart';

class CardList extends StatelessWidget {
  const CardList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentCubit, PaymentState>(
      builder: (_, state) {
        if (state is PaymentLoading) {
          return const Center(child: CustomProgressLoading.medium());
        } else if (state is PaymentSuccess) {
          return SizedBox(
            height: 150.h,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: state.cards.length,
              itemBuilder: (context, index) {
                final paymentCard = state.cards[index];
                return Padding(
                  padding: AppPaddings.v8,
                  child: PaymentCard.compact(
                    cardNumber: paymentCard.number,
                    expiryDate: paymentCard.date,
                    logoPath: AppAssets.master,
                    cardHolderName: paymentCard.name,
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
