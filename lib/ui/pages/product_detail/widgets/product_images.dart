import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../data/models/remote/response/product_detail_response.dart';

class ProductImages extends StatefulWidget {
  final List<ProductImage> images;

  const ProductImages({
    super.key,
    required this.images,
  });

  @override
  State<ProductImages> createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  late PageController _pageController;
  late ValueNotifier<double> _currentPageNotifier;
  final double _imageWidth = 349.w;
  final double _horizontalPadding = 40.w;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: _imageWidth / (1.sw - _horizontalPadding * 2),
    );
    _currentPageNotifier = ValueNotifier<double>(0);
    
    _pageController.addListener(() {
      _currentPageNotifier.value = _pageController.page ?? 0;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _currentPageNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 442.h,
          child: PageView.builder(
            controller: _pageController,
            padEnds: false,
            itemCount: widget.images.length,
            itemBuilder: (context, index) {
              return ValueListenableBuilder<double>(
                valueListenable: _currentPageNotifier,
                builder: (context, currentPage, _) {
                  final double relativePosition = index - currentPage;
                  // Scale factor for current image
                  final double scale = 1 - (relativePosition.abs() * 0.1).clamp(0.0, 0.4);
                  // Opacity factor for surrounding images
                  final double opacity = 1 - (relativePosition.abs() * 0.3).clamp(0.0, 0.7);
                  
                  return Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.002) // perspective
                      ..translate(relativePosition * 20)
                      ..scale(scale),
                    alignment: Alignment.center,
                    child: Opacity(
                      opacity: opacity,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: index == 0 ? _horizontalPadding : 10.w,
                          right: index == widget.images.length - 1 ? _horizontalPadding : 10.w,
                        ),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: SizedBox(
                              height: 442.h,
                              width: _imageWidth,
                              child: ColoredBox(
                                color: AppColors.superSilver,
                                child: Image.network(
                                  'https://rmusayevr.pythonanywhere.com${widget.images[index].image}',
                                  width: _imageWidth,
                                  height: 442.h,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const ColoredBox(
                                      color: AppColors.superSilver,
                                      child: Center(
                                        child: Icon(Icons.error_outline),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
        // Page Indicator
        Positioned(
          bottom: 20.h,
          left: 0,
          right: 0,
          child: ValueListenableBuilder<double>(
            valueListenable: _currentPageNotifier,
            builder: (context, currentPage, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.images.length,
                  (index) {
                    final isActive = (index - currentPage).abs() < 0.5;
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: EdgeInsets.symmetric(horizontal: 4.w),
                      height: 8.h,
                      width: isActive ? 24.w : 8.w,
                      decoration: BoxDecoration(
                        color: isActive ? AppColors.primary : AppColors.platinum,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}