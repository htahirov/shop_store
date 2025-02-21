import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../cubits/order/order_cubit.dart';
import '../../../cubits/order/order_state.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_constants.dart';
import '../../../utils/constants/app_text_styles.dart';
import '../../../utils/helpers/go.dart';
import '../../../utils/helpers/pager.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_nav_bar_button.dart';
import '../../widgets/custom_progress_loading.dart';
import 'widgets/order_detail_info_item.dart';
import 'widgets/order_status_badge.dart';

class OrderDetailPage extends StatefulWidget {
  final String orderId;

  const OrderDetailPage({
    super.key,
    required this.orderId,
  });

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  @override
  void initState() {
    super.initState();
    context.read<OrderCubit>().getOrderDetail(widget.orderId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Detail Order',
        onLeadingPressed: () => Go.pop(context),
      ),
      body: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          if (state is OrderLoading) {
            return const Center(
              child: CustomProgressLoading(size: 50),
            );
          }

          if (state is OrderDetailSuccess) {
            final order = state.order;

            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  
                  // Order Header with Info
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'INV #${order.code}',
                            style: AppTextStyles.cardDescriptionTextStyle,
                          ),
                          SizedBox(width: 14.w),
                          OrderStatusBadge(status: order.status),
                        ],
                      ),
                      Text(
                        order.date,
                        style: AppTextStyles.mainTextStyle.copyWith(
                          color: AppColors.madeInTheShade,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),

                  // Basic Order Info
                  OrderDetailInfoItem(
                    label: 'No Resi',
                    value: order.resiNumber,
                  ),
                  SizedBox(height: 20.h),

                  OrderDetailInfoItem(
                    label: 'Delivery',
                    value: order.deliveryService,
                  ),
                  SizedBox(height: 20.h),

                  OrderDetailInfoItem(
                    label: 'Payment Method',
                    value: order.paymentMethod,
                  ),
                  SizedBox(height: 20.h),

                  const Divider(color: AppColors.platinum),
                  SizedBox(height: 20.h),

                  // Delivery Location
                  Text(
                    'Delivery Location',
                    style: AppTextStyles.cardDescriptionTextStyle,
                  ),
                  SizedBox(height: 20.h),

                  Text(
                    'Home',
                    style: AppTextStyles.cardDescriptionTextStyle,
                  ),
                  SizedBox(height: 10.h),

                  Text(
                    order.address,
                    style: AppTextStyles.mainTextStyle.copyWith(
                      color: AppColors.madeInTheShade,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 20.h),

                  const Divider(color: AppColors.platinum),
                  SizedBox(height: 20.h),

                  // Order Items
                  Text(
                    'Order Info',
                    style: AppTextStyles.cardDescriptionTextStyle,
                  ),
                  SizedBox(height: 20.h),

                  ...order.items.map((item) => Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: OrderDetailInfoItem(
                      label: '${item.name} x${item.quantity}',
                      value: '\$${item.price}',
                    ),
                  )),
                  SizedBox(height: 20.h),

                  // Order Summary
                  OrderDetailInfoItem(
                    label: 'Promo Code',
                    value: order.promoCode ?? '-',
                  ),
                  SizedBox(height: 20.h),

                  OrderDetailInfoItem(
                    label: 'Sub Total',
                    value: '\$${order.subtotal}',
                  ),
                  SizedBox(height: 10.h),

                  OrderDetailInfoItem(
                    label: 'Shipping',
                    value: order.shipping == 0 ? 'FREE' : '\$${order.shipping}',
                    valueStyle: order.shipping == 0 
                        ? AppTextStyles.mainTextStyle.copyWith(
                            color: AppColors.jadePalace,
                          )
                        : null,
                  ),
                  SizedBox(height: 20.h),

                  const Divider(color: AppColors.platinum),
                  SizedBox(height: 20.h),

                  OrderDetailInfoItem(
                    label: 'Total',
                    value: '\$${order.total}',
                    valueStyle: AppTextStyles.mainTextStyle.copyWith(
                      color: AppColors.redmana,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 40.h),
                ],
              ),
            );
          }

          if (state is OrderError) {
            return Center(
              child: Text(state.message),
            );
          }

          return const Center(
            child: Text('Order not found'),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 20.h),
        child: CustomNavbarButton(
          title: 'Track Order',
          onPressed: () => Go.to(
            context,
            Pager.orderTrack(widget.orderId),
          ),
        ),
      ),
    );
  }
}