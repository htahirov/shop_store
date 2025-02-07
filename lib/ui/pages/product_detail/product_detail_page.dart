import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_assets.dart';
import '../../../utils/constants/app_constants.dart';
import '../../../utils/helpers/go.dart';
import '../../../cubits/product_detail/product_detail_cubit.dart';
import 'widgets/product_images.dart';
import 'widgets/product_info.dart';
import 'widgets/bottom_cart_section.dart';
import 'widgets/reviews_list.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductDetailCubit>();
    
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: InkWell(
              onTap: () => Go.pop(context),
              child: SvgPicture.asset(
                AppAssets.arrowLeft,
                fit: BoxFit.none,
              ),
            ),
            actions: [
              InkWell(
                onTap: cubit.addToFavorites,
                child: CircleAvatar(
                  radius: 17.5.r,
                  backgroundColor: AppColors.platinum,
                  child: const Icon(
                    Icons.favorite_border,
                    color: AppColors.darkRift,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProductImages(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
                child: BlocBuilder<ProductDetailCubit, ProductDetailState>(
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ProductInfo(),
                        SizedBox(height: 20.h),
                        _buildSection(
                          title: 'Description',
                          isExpanded: cubit.isDescriptionExpanded,
                          onTap: cubit.toggleDescription,
                          content: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                            style: TextStyle(
                              color: AppColors.titleTextColor,
                              fontSize: 14.sp,
                              fontFamily: AppConstants.fontFamilyNunito,
                              fontWeight: FontWeight.w400,
                              height: 1.57,
                              letterSpacing: -0.07,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        _buildSection(
                          title: 'Reviews',
                          isExpanded: cubit.isReviewsExpanded,
                          onTap: cubit.toggleReviews,
                          content: const ReviewsList(),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      bottomSheet: const BottomCartSection(),
    );
  }

  Widget _buildSection({
    required String title,
    required bool isExpanded,
    required VoidCallback onTap,
    required Widget content,
  }) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: AppColors.titleTextColor,
                  fontSize: 14.sp,
                  fontFamily: AppConstants.fontFamilyNunito,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.07,
                ),
              ),
              Icon(
                isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                size: 24.r,
                color: AppColors.titleTextColor,
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        Container(
          decoration: const ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: AppColors.chefsHat,
              ),
            ),
          ),
        ),
        if (isExpanded) ...[
          SizedBox(height: 20.h),
          content,
        ],
      ],
    );
  }
}