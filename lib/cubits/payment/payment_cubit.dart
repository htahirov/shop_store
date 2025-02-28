import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/local/payment_card_model.dart';
import '../../data/services/local/payment_hive_service.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final cardNameController = TextEditingController();
  final cardNumberController = TextEditingController();
  final expiresDateController = TextEditingController();
  final cvvController = TextEditingController();
  int? selectedCardId;

  Future<void> savePaymentData() async {
    if (formKey.currentState!.validate()) {
      final paymentCard = PaymentCardModel(
        id: DateTime.now().millisecondsSinceEpoch,
        name: cardNameController.text,
        number: cardNumberController.text,
        date: expiresDateController.text,
        code: cvvController.text,
      );

      try {
        await PaymentHiveService.saveData(paymentCard);
        getPaymentData();
      } catch (e) {
        emit(PaymentError(e.toString()));
      }
    }
  }

  Future<void> getPaymentData() async {
    try {
       List<PaymentCardModel>? paymentCard = await PaymentHiveService.getData();
      if (paymentCard != null) {
        emit(PaymentSuccess(paymentCard,selectedCardId));
      } else {
        emit(PaymentError('No payment card found'));
      }
    } catch (e) {
      emit(PaymentError("Error: ${e.toString()}"));
    }
  }

   void selectCard(int cardId) {
    selectedCardId = cardId;
    if (state is PaymentSuccess) {
      emit(PaymentSuccess((state as PaymentSuccess).cards, selectedCardId));
    }
  }
}
