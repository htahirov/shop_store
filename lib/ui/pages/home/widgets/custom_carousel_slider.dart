import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants/app_assets.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_constants.dart';
import '../../../../utils/constants/app_radiuses.dart';
import '../../../../utils/constants/app_texts.dart';

class CustomCarouselSlider extends StatefulWidget {
  final double height;
  final double width;

  const CustomCarouselSlider({
    super.key,
    this.height = 160.0,
    this.width = 350.0,
  });

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  final PageController _pageController = PageController();
  final List<String> _imageUrls = [
    AppAssets.carousel1,
    AppAssets.carousel1,
    AppAssets.carousel1,
  ];

  late Timer _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (_currentPage < _imageUrls.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 1500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.height.h,
          width: widget.width.w,
          child: PageView.builder(
            controller: _pageController,
            itemCount: _imageUrls.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: AppRadiuses.a16,
                child: Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.darkRift,
                            blurRadius: 20,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Image.asset(
                        _imageUrls[index],
                        fit: BoxFit.cover,
                        width: widget.width,
                        height: widget.height,
                      ),
                    ),
                    Positioned(
                      bottom: 105.h,
                      left: 20.w,
                      child: Text(
                        AppTexts.saleUpTo,
                        style: TextStyle(
                          fontFamily: AppConstants.fontFamilyNunito,
                          fontSize: 16.sp,
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 50.h,
                      left: 25.w,
                      child: Text(
                        AppTexts.positioned2,
                        style: TextStyle(
                          fontFamily: AppConstants.fontFamilyNunito,
                          fontSize: 45.sp,
                          color: AppColors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 35.h,
                      left: 90.w,
                      child: Text(
                        AppTexts.off,
                        style: TextStyle(
                          fontFamily: AppConstants.fontFamilyNunito,
                          fontSize: 16.sp,
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
