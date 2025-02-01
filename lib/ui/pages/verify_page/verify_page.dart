import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_store/ui/pages/verify_page/widgets/custom_verify_text_form_field.dart';
import 'package:shop_store/ui/widgets/custom_app_bar.dart';
import 'package:shop_store/ui/widgets/custom_fab_button.dart';
import 'package:shop_store/ui/widgets/custom_text_button.dart';
import 'package:shop_store/utils/constants/app_colors.dart';
import 'package:shop_store/utils/constants/app_paddings.dart';
import 'package:shop_store/utils/constants/app_text_styles.dart';
import 'package:shop_store/utils/constants/app_texts.dart';
import 'package:shop_store/utils/helpers/go.dart';
import 'package:shop_store/utils/helpers/pager.dart';

class VerifyPage extends StatelessWidget {
  const VerifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppTexts.verify,
      ),
      body: Column(
        children: [
          Padding(
            padding: AppPaddings.h40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppTexts.veritifactionText,
                  style: AppTextStyles.verifyTextStyle.copyWith(),
                ),
                Text(
                  "Login Email",
                  style: AppTextStyles.verifyTextStyle.copyWith(
                    height: 19.1 / 14.sp,
                  ),
                ),
                40.verticalSpace,
                CustomVerifyTextFormField(),
                20.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppTexts.recevieCode,
                      style: AppTextStyles.verifyTextStyle.copyWith(
                        color: AppColors.textButtonColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        AppTexts.resendCode,
                        style: AppTextStyles.verifyTextStyle.copyWith(
                          color: AppColors.primary,
                          height: 19.1.h / 14.sp,
                        ),
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
                  text: AppTexts.signUp,
                  onPressed: () {
                    Go.replace(context, Pager.signUp);
                  },
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
