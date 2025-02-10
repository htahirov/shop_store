import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../data/models/remote/response/product_detail_responce.dart';
import '../../../../utils/constants/app_colors.dart';

class ProductImages extends StatelessWidget {
  final List<ProductImage> images;

  const ProductImages({
    super.key,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 442.h,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Row(
            children: images.map((image) {
              return Padding(
                padding: EdgeInsets.only(right: images.last != image ? 20.w : 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Container(
                    height: 442.h,
                    width: 349.w,
                    color: AppColors.superSilver,
                    child: Image.network(
                      'https://rmusayevr.pythonanywhere.com${image.image}',
                      width: 349.w,
                      height: 442.h,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: AppColors.superSilver,
                          child: const Center(
                            child: Icon(Icons.error_outline),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}