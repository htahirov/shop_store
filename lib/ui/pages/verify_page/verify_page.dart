import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_store/ui/pages/verify_page/widgets/custom_verify_text_form_field.dart';
import 'package:shop_store/ui/widgets/custom_app_bar.dart';
import 'package:shop_store/ui/widgets/custom_fab_button.dart';
import 'package:shop_store/ui/widgets/custom_text_button.dart';
import 'package:shop_store/utils/constants/app_colors.dart';
import 'package:shop_store/utils/constants/app_constants.dart';
import 'package:shop_store/utils/constants/app_paddings.dart';

class VerifyPage extends StatelessWidget {
  const VerifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Verification code",
      ),
      body: Column(
        children: [
          Padding(
            padding: AppPaddings.h40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Please enter the 4 digit code sent to",
                  style: TextStyle(
                    color: AppColors.titleTextColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    height: 22 / 14.sp,
                    letterSpacing: -0.5,
                  ),
                ),
                Text(
                  "Login Email",
                  style: TextStyle(
                    color: AppColors.titleTextColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    height: 19.1 / 14.sp,
                    letterSpacing: -0.5,
                  ),
                ),
                40.verticalSpace,
                CustomVerifyTextFormField(),
                20.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "I didn’t recevie code.",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: AppConstants.fontFamily,
                        height: 22.h / 14.sp,
                        letterSpacing: -0.5,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Resend code",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: AppConstants.fontFamily,
                            height: 19.1.h / 14.sp,
                            letterSpacing: -0.5),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding:
                EdgeInsets.only(bottom: ScreenUtil().bottomBarHeight + 40.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextButton(
                  text: "Sign up",
                  onPressed: () {},
                ),
                240.horizontalSpace,
                CustomFabButton(onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
