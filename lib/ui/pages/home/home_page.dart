import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/app_paddings.dart';
import '../../widgets/custom_nav_bar.dart';
import '../../widgets/simple_app_bar.dart';
import 'widgets/category_selection.dart';
import 'widgets/custom_carousel_slider.dart';
import 'widgets/home_grid_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar.home(),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPaddings.h40 + AppPaddings.t20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomCarouselSlider(),
              35.verticalSpace,
              const CategorySelectionRow(),
              20.verticalSpace,
              HomeGridView(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomNavbar(),
    );
  }
}
