import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/app_paddings.dart';
import '../../../utils/constants/app_texts.dart';
import '../../widgets/custom_app_bar.dart';
import 'widgets/custom_colors_circles.dart';
import 'widgets/custom_discount.dart';
import 'widgets/custom_drop_button.dart';
import 'widgets/custom_filter_buttons.dart';
import 'widgets/custom_slider.dart';
import 'widgets/custom_star_rating.dart';
import 'widgets/custom_titles.dart';


class FilterPage extends StatelessWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: AppTexts.filter,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: AppPaddings.h40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                30.verticalSpace,
                const CustomTitles(text: "Price"),
                20.verticalSpace,
                const CustomSlider(),
                28.verticalSpace,
                const CustomTitles(text: "Color"),
                30.verticalSpace,
                CustomColorsCircles(),
                30.verticalSpace,
                const CustomTitles(text: "Star Rating"),
                20.verticalSpace,
                const CustomStarRating(),
                30.verticalSpace,
                const CustomTitles(text: "Category"),
                20.verticalSpace,
                CustomDropButton(),
                30.verticalSpace,
                const CustomTitles(text: "Discount"),
                20.verticalSpace,
                CustomDiscount(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                const CustomFilterButtons(),
              ],
            ),
          ),
        ));
  }
}
