import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../cubits/adress/adress_cubit.dart';
import '../../../utils/constants/app_assets.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_paddings.dart';
import '../../../utils/helpers/go.dart';
import '../../../utils/helpers/pager.dart';
import '../../../utils/screen/snackbars.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_input.dart';

class AddAddressPage extends StatelessWidget {
  const AddAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    final addressCubit = context.read<AdressCubit>();

    return Scaffold(
      appBar: CustomAppBar(
        title: "Add Address",
        leadIcon: AppAssets.arrowLeft,
        onLeadingPressed: () => Go.replace(context, Pager.address),
      ),
      body: BlocBuilder<AdressCubit, AdressState>(
        builder: (_, state) {
          return Form(
            key: addressCubit.formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: AppPaddings.h40,
                child: Column(
                  children: [
                    CustomInput(
                      title: "Address Name",
                      controller: addressCubit.addressNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an address name';
                        }
                        return null;
                      },
                    ),
                    20.verticalSpace,
                    CustomInput(
                      title: "Name",
                      controller: addressCubit.nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a name';
                        }
                        return null;
                      },
                    ),
                    20.verticalSpace,
                    CustomInput(
                      title: "Phone Number",
                      keyboardType: TextInputType.number,
                      controller: addressCubit.phoneController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a phone number';
                        }
                        return null;
                      },
                    ),
                    20.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: CustomInput(
                            maxLines: 1,
                            title: "City",
                            controller: addressCubit.cityController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a city';
                              }
                              return null;
                            },
                          ),
                        ),
                        10.horizontalSpace,
                        Expanded(
                          child: CustomInput(
                            maxLines: 1,
                            title: "State",
                            controller: addressCubit.stateController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a state';
                              }
                              return null;
                            },
                          ),
                        ),
                        10.horizontalSpace,
                        Expanded(
                          child: CustomInput(
                            maxLines: 1,
                            title: "Zip Code",
                            keyboardType: TextInputType.number,
                            controller: addressCubit.zipController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a zip code';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    90.verticalSpace,
                    SizedBox(
                      height: 33.h,
                      width: 349.w,
                      child: BlocConsumer<AdressCubit, AdressState>(
                        listener: (context, state) {
                          if (state is AdressSuccess) {
                            Snackbars.showSuccess(
                              context,
                              message: 'Address saved successfully!',
                            );
                          } else if (state is AdressError) {
                            Snackbars.showError(
                              context,
                              message: state.message,
                            );
                          }
                        },
                        builder: (_, state) {
                          return ElevatedButton(
                            onPressed: state is AdressLoading
                                ? null
                                : () async {
                                    if (addressCubit.formKey.currentState!
                                        .validate()) {
                                      await context
                                          .read<AdressCubit>()
                                          .saveAdressData();
                                      Navigator.pop(context);
                                    }
                                  },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              
                            ),
                            child: const Text(
                                    "Save Address",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: AppColors.inputTextColor,
                                    ),
                                  ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
