import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/constants/app_assets.dart';
import '../skeleton_loader.dart';
import 'carousel_items.dart';

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
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });

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
          child: _isLoading
              ? SkeletonLoader(
                  height: widget.height.h,
                  width: widget.width.w,
                )
              : PageView.builder(
                  controller: _pageController,
                  itemCount: _imageUrls.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return CarouselItems(
                      imageUrl: _imageUrls[index],
                      width: widget.width,
                      height: widget.height,
                    );
                  },
                ),
        ),
      ],
    );
  }
}
