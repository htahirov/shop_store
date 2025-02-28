import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_store/utils/constants/app_assets.dart';
import 'package:shop_store/utils/constants/app_colors.dart';
import 'package:shop_store/utils/helpers/pager.dart';
import '../../../cubits/adress/adress_cubit.dart';
import '../../../utils/constants/app_paddings.dart';
import '../../../utils/helpers/go.dart';
import '../../widgets/custom_add_button.dart';
import '../../widgets/custom_app_bar.dart';
import '../cart/widgets/cart_steps_indicator.dart';
import 'widgets/address_cart.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Address",
      ),
      body: SafeArea(
        child: Padding(
          padding: AppPaddings.h24,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: CartStepsIndicator('Address'),
              ),
              30.verticalSpace,
              Row(
                children: [
                  CustomAddButton(
                    onPressed: () => Go.to(context, Pager.addAdrress),
                  ),
                  18.horizontalSpace,
                  Expanded(
                    child: BlocBuilder<AdressCubit, AdressState>(
                      builder: (context, state) {
                        return GestureDetector(
                          onTap: () {
                            // Go.to(context, Pager.home);
                          },
                          child: const AddressCard(),
                        );
                      },
                    ),
                  ),
                ],
              ),
              150.verticalSpace,
              SizedBox(
                height: 33.h,
                width: 349.w,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      )),
                  onPressed: () {},
                  child: Row(
                    children: [
                      const Text("Payment",
                          style: TextStyle(
                              fontSize: 14, color: AppColors.inputTextColor)),
                      const Spacer(),
                      SvgPicture.asset(
                        AppAssets.arrowRight,
                        height: 32.r,
                        width: 32.r,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
