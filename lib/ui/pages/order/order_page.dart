import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../cubits/order/order_cubit.dart';
import '../../../cubits/order/order_state.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_constants.dart';
import '../../../utils/helpers/go.dart';
import '../../../utils/helpers/pager.dart';
import '../../widgets/custom_nav_bar.dart';
import '../../widgets/custom_progress_loading.dart';
import '../../widgets/order_card.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(
          children: [
            30.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 40.w,
                vertical: 20.h,
              ),
              child: Text(
                'My Order',
                style: TextStyle(
                  color: AppColors.titleTextColor,
                  fontSize: 26.sp,
                  fontFamily: AppConstants.fontFamilyNunito,
                  fontWeight: FontWeight.w700,
                  height: 1.35,
                  letterSpacing: -0.13,
                ),
              ),
            ),

            // Tab Bar
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.platinum,
                    width: 1.0,
                  ),
                ),
              ),
              child: TabBar(
                tabs: const [
                  Tab(text: 'On Going'),
                  Tab(text: 'Completed'),
                  Tab(text: 'Cancelled'),
                ],
                labelColor: AppColors.titleTextColor,
                unselectedLabelColor: AppColors.madeInTheShade,
                labelStyle: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: AppConstants.fontFamilyNunito,
                  fontWeight: FontWeight.w600,
                ),
                unselectedLabelStyle: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: AppConstants.fontFamilyNunito,
                  fontWeight: FontWeight.w400,
                ),
                indicatorColor: AppColors.jadePalace,
                indicatorWeight: 3.0,
                indicatorSize: TabBarIndicatorSize.tab,
              ),
            ),

            // Tab Bar View
            Expanded(
              child: TabBarView(
                children: [
                  // Ongoing Orders
                  BlocBuilder<OrderCubit, OrderState>(
                    builder: (context, state) {
                      if (state is OrderLoading) {
                        return const Center(
                          child: CustomProgressLoading(size: 50),
                        );
                      }

                      if (state is OrderListSuccess) {
                        final ongoingOrders = state.orders.where((order) => 
                          order.status == 'Order Received' || order.status == 'Processing'
                        ).toList();

                        if (ongoingOrders.isEmpty) {
                          return const Center(
                            child: Text('No ongoing orders found'),
                          );
                        }

                        return ListView.separated(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 20.h,
                          ),
                          itemCount: ongoingOrders.length,
                          separatorBuilder: (_, __) => SizedBox(height: 20.h),
                          itemBuilder: (context, index) {
                            final order = ongoingOrders[index];
                            return OrderCard(
                              productName: order.productName,
                              quantity: order.quantity.toString(),
                              price: order.price,
                              imageUrl: order.imageUrl,
                              colorHex: Color(int.parse(order.colorHex.replaceAll('#', '0xFF'))),
                              onViewOrder: () => Go.to(
                                context,
                                Pager.orderDetail(order.code),
                              ),
                            );
                          },
                        );
                      }

                      if (state is OrderError) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                state.message,
                                style: TextStyle(
                                  color: AppColors.redmana,
                                  fontSize: 14.sp,
                                  fontFamily: AppConstants.fontFamilyNunito,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 20.h),
                              ElevatedButton(
                                onPressed: () => context.read<OrderCubit>().getOrders(),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.jadePalace,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.r),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                                ),
                                child: Text(
                                  'Try Again',
                                  style: TextStyle(
                                    color: AppColors.titleTextColor,
                                    fontSize: 14.sp,
                                    fontFamily: AppConstants.fontFamilyNunito,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }

                      return const Center(
                        child: Text('No orders found'),
                      );
                    },
                  ),

                  // Completed Orders
                  BlocBuilder<OrderCubit, OrderState>(
                    builder: (context, state) {
                      if (state is OrderLoading) {
                        return const Center(
                          child: CustomProgressLoading(size: 50),
                        );
                      }

                      if (state is OrderListSuccess) {
                        final completedOrders = state.orders.where((order) => 
                          order.status == 'Delivered'
                        ).toList();

                        if (completedOrders.isEmpty) {
                          return const Center(
                            child: Text('No completed orders found'),
                          );
                        }

                        return ListView.separated(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 20.h,
                          ),
                          itemCount: completedOrders.length,
                          separatorBuilder: (_, __) => SizedBox(height: 20.h),
                          itemBuilder: (context, index) {
                            final order = completedOrders[index];
                            return OrderCard(
                              productName: order.productName,
                              quantity: order.quantity.toString(),
                              price: order.price,
                              imageUrl: order.imageUrl,
                              colorHex: Color(int.parse(order.colorHex.replaceAll('#', '0xFF'))),
                              onViewOrder: () => Go.to(
                                context,
                                Pager.orderDetail(order.code),
                              ),
                            );
                          },
                        );
                      }

                      if (state is OrderError) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                state.message,
                                style: TextStyle(
                                  color: AppColors.redmana,
                                  fontSize: 14.sp,
                                  fontFamily: AppConstants.fontFamilyNunito,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 20.h),
                              ElevatedButton(
                                onPressed: () => context.read<OrderCubit>().getOrders(),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.jadePalace,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.r),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                                ),
                                child: Text(
                                  'Try Again',
                                  style: TextStyle(
                                    color: AppColors.titleTextColor,
                                    fontSize: 14.sp,
                                    fontFamily: AppConstants.fontFamilyNunito,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }

                      return const Center(
                        child: Text('No orders found'),
                      );
                    },
                  ),

                  // Cancelled Orders
                  BlocBuilder<OrderCubit, OrderState>(
                    builder: (context, state) {
                      if (state is OrderLoading) {
                        return const Center(
                          child: CustomProgressLoading(size: 50),
                        );
                      }

                      if (state is OrderListSuccess) {
                        final cancelledOrders = state.orders.where((order) => 
                          order.status == 'Cancelled'
                        ).toList();

                        if (cancelledOrders.isEmpty) {
                          return const Center(
                            child: Text('No cancelled orders found'),
                          );
                        }

                        return ListView.separated(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 20.h,
                          ),
                          itemCount: cancelledOrders.length,
                          separatorBuilder: (_, __) => SizedBox(height: 20.h),
                          itemBuilder: (context, index) {
                            final order = cancelledOrders[index];
                            return OrderCard(
                              productName: order.productName,
                              quantity: order.quantity.toString(),
                              price: order.price,
                              imageUrl: order.imageUrl,
                              colorHex: Color(int.parse(order.colorHex.replaceAll('#', '0xFF'))),
                              onViewOrder: () => Go.to(
                                context,
                                Pager.orderDetail(order.code),
                              ),
                            );
                          },
                        );
                      }

                      if (state is OrderError) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                state.message,
                                style: TextStyle(
                                  color: AppColors.redmana,
                                  fontSize: 14.sp,
                                  fontFamily: AppConstants.fontFamilyNunito,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 20.h),
                              ElevatedButton(
                                onPressed: () => context.read<OrderCubit>().getOrders(),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.jadePalace,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.r),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                                ),
                                child: Text(
                                  'Try Again',
                                  style: TextStyle(
                                    color: AppColors.titleTextColor,
                                    fontSize: 14.sp,
                                    fontFamily: AppConstants.fontFamilyNunito,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }

                      return const Center(
                        child: Text('No orders found'),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        // bottomNavigationBar: const CustomNavbar(),
      ),
    );
  }
}