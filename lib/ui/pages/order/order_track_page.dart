import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../cubits/order/order_cubit.dart';
import '../../../cubits/order/order_state.dart';
import '../../../utils/constants/app_assets.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_constants.dart';
import '../../../utils/constants/app_text_styles.dart';
import '../../../utils/helpers/go.dart';
import '../../../utils/helpers/pager.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_nav_bar.dart';
import '../../widgets/custom_progress_loading.dart';
import 'widgets/order_tracking_step.dart';
import 'widgets/tracking_dots_connector.dart';

class OrderTrackPage extends StatefulWidget {
  final String orderId;

  const OrderTrackPage({
    super.key,
    required this.orderId,
  });

  @override
  State<OrderTrackPage> createState() => _OrderTrackPageState();
}

class _OrderTrackPageState extends State<OrderTrackPage> {
  @override
  void initState() {
    super.initState();
    context.read<OrderCubit>().trackOrder(widget.orderId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Track Order',
        leadIcon: AppAssets.arrowLeft,
        onLeadingPressed: () => Go.to(context, Pager.orderDetail(widget.orderId)),
      ),
      body: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          if (state is OrderLoading) {
            return const Center(
              child: CustomProgressLoading(size: 50),
            );
          }

          if (state is OrderTrackingSuccess) {
            final tracking = state.tracking;
            
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  
                  // Delivery info
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Delivered on ',
                          style: TextStyle(
                            color: AppColors.madeInTheShade,
                            fontSize: 14.sp,
                            fontFamily: AppConstants.fontFamilyNunito,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: tracking['deliveryDate'] ?? '15.07.21',
                          style: AppTextStyles.cardDescriptionTextStyle,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  
                  // Tracking number
                  Row(
                    children: [
                      Text(
                        'Tracking Number: ',
                        style: TextStyle(
                          color: AppColors.madeInTheShade,
                          fontSize: 14.sp,
                          fontFamily: AppConstants.fontFamilyNunito,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        tracking['trackingNumber'] ?? 'MY2133568841592H',
                        style: AppTextStyles.cardDescriptionTextStyle,
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  
                  // Tracking Timeline
                  const Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // Delivered
                          OrderTrackingStep(
                            title: 'Parcel is successfully delivered',
                            date: '15 July 10:25',
                            isActive: true,
                          ),
                          TrackingDotsConnector(
                            color: AppColors.titleTextColor,
                          ),
                          
                          // Out for delivery
                          OrderTrackingStep(
                            title: 'Parcel is out for delivery',
                            date: '15 July 10:00',
                          ),
                          TrackingDotsConnector(),
                          
                          // Received at branch
                          OrderTrackingStep(
                            title: 'Parcel is received at delivery Branch',
                            date: '14 July 13:25',
                          ),
                          TrackingDotsConnector(),
                          
                          // In transit
                          OrderTrackingStep(
                            title: 'Parcel is in transit',
                            date: '13 July 08:00',
                          ),
                          TrackingDotsConnector(),
                          
                          // Shipped
                          OrderTrackingStep(
                            title: 'Sender has shipped your parcel',
                            date: '12 July 14:25',
                          ),
                          TrackingDotsConnector(),
                          
                          // Preparing
                          OrderTrackingStep(
                            title: 'Sender is preparing to ship your order',
                            date: '12 July 15:38',
                            isLast: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  // Rating card
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20.h),
                    padding: EdgeInsets.all(14.w),
                    decoration: BoxDecoration(
                      color: AppColors.ghostWhite,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Added track_rate.png image here
                        Image.asset(
                          'assets/grid/track_rate.png',
                          width: 70.w,
                          height: 63.h,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Don\'t forget to rate',
                                style: AppTextStyles.cardDescriptionTextStyle,
                              ),
                              SizedBox(height: 3.h),
                              Text(
                                'Rate product to get 5 points for collect.',
                                style: TextStyle(
                                  color: AppColors.madeInTheShade,
                                  fontSize: 14.sp,
                                  fontFamily: AppConstants.fontFamilyNunito,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Row(
                                children: List.generate(
                                  5,
                                  (index) => Icon(
                                    Icons.star_border,
                                    color: AppColors.primary,
                                    size: 24.r,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
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
            child: Text('No tracking information available'),
          );
        },
      ),
    );
  }
}