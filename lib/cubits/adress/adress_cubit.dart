import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_store/data/models/local/address_model.dart';
import 'package:shop_store/data/services/local/address_hive_service.dart';

part 'adress_state.dart';

class AdressCubit extends Cubit<AdressState> {
  AdressCubit() : super(AdressInitial());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final addressNameController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final stateController = TextEditingController();
  final zipController = TextEditingController();
  final cityController = TextEditingController();

  Future<void> saveAdressData() async {
    if (!(formKey.currentState?.validate() ?? true)) {
      return;
    }

    final address = AddressModel(
      addressName: addressNameController.text,
      phoneNumber: phoneController.text,
      city: cityController.text,
      state: stateController.text,
      zipCode: zipController.text,
    );

    try {
      await AddressHiveService.saveData(address);
      getAdressData();
    } catch (e) {
      emit(AdressError(e.toString()));
    }
  }

  Future<void> getAdressData() async {
    try {
      List<AddressModel>? adress = await AddressHiveService.getData();
      if (adress != null && adress.isNotEmpty) {
        emit(AdressSuccess(adress));
      } else {
        emit(AdressError('No address found'));
      }
    } catch (e) {
      emit(AdressError("Error: ${e.toString()}"));
    }
  }
}
