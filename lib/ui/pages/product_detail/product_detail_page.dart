import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubits/product_detail/product_detail_cubit.dart';
import '../../../utils/screen/snackbars.dart';
import 'widgets/bottom_cart_section.dart';
import 'widgets/shimmer/product_detail_shimmer.dart';
import 'widgets/product_detail_app_bar.dart';
import 'widgets/product_detail_content.dart';

class ProductDetailPage extends StatefulWidget {
  final String slug;
  
  const ProductDetailPage({
    super.key,
    required this.slug,
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductDetailCubit>().getProductDetail(widget.slug);
    });
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductDetailCubit>();
    
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ProductDetailAppBar(
              onFavoritePressed: cubit.addToFavorites,
            ),
            Expanded(
              child: BlocConsumer<ProductDetailCubit, ProductDetailState>(
                listener: (context, state) {
                  if (state is ProductDetailError) {
                    Snackbars.showError(context, message: state.message);
                  }
                },
                builder: (context, state) {
                  if (state is ProductDetailLoading) {
                    return const ProductDetailShimmer();
                  }

                  final productDetail = cubit.productDetail;
                  if (productDetail == null) {
                    return const Center(
                      child: Text('No product details available'),
                    );
                  }

                  return ProductDetailContent(
                    product: productDetail,
                    isDescriptionExpanded: cubit.isDescriptionExpanded,
                    isReviewsExpanded: cubit.isReviewsExpanded,
                    onToggleDescription: cubit.toggleDescription,
                    onToggleReviews: cubit.toggleReviews,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomSheet: BlocBuilder<ProductDetailCubit, ProductDetailState>(
        builder: (context, state) {
          if (state is ProductDetailLoading || cubit.productDetail == null) {
            return const SizedBox.shrink();
          }
          
          return BottomCartSection(
            price: cubit.productDetail!.price,
            totalPrice: cubit.productDetail!.totalPrice,
            discountInterest: cubit.productDetail!.discountInterest,
          );
        },
      ),
    );
  }
}