import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_store/cubits/adress/adress_cubit.dart';
import 'package:shop_store/data/models/local/address_model.dart';
import 'package:shop_store/utils/constants/app_colors.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdressCubit, AdressState>(
      builder: (context, state) {
        if (state is AdressSuccess && state.address.isNotEmpty) {
          return SizedBox(
            height: 189.h, 
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: false, 
              itemCount: state.address.length,
              itemBuilder: (context, index) {
                final AddressModel address = state.address[index];
                return Container(
                  width: 137.w,
                  margin: EdgeInsets.only(right: 12.w), 
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: Colors.grey.shade300),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 6,
                        spreadRadius: 2,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8.w),
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: const Icon(Icons.home, color: Colors.black54),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: Text(
                              address.addressName,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        address.phoneNumber,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "${address.city}, ${address.state}, ${address.zipCode}",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        } else if (state is AdressLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is AdressError) {
          return Center(child: Text("Error: ${state.message}"));
        } else {
          return const Center(child: Text("No address available"));
        }
      },
    );
  }
}