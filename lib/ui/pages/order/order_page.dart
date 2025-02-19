import 'package:buttons_tabbar/buttons_tabbar.dart';
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
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              // Title
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
              ButtonsTabBar(
                backgroundColor: AppColors.jadePalace,
                unselectedBackgroundColor: Colors.transparent,
                labelStyle: TextStyle(
                  color: AppColors.titleTextColor,
                  fontSize: 14.sp,
                  fontFamily: AppConstants.fontFamilyNunito,
                  fontWeight: FontWeight.w600,
                ),
                unselectedLabelStyle: TextStyle(
                  color: AppColors.titleTextColor,
                  fontSize: 14.sp,
                  fontFamily: AppConstants.fontFamilyNunito,
                  fontWeight: FontWeight.w400,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
                height: 35.h,
                tabs: const [
                  Tab(text: 'On Going'),
                  Tab(text: 'Completed'),
                  Tab(text: 'Cancelled'),
                ],
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
                          final ongoingOrders = state.orders
                              .where((order) =>
                                  order.status == 'Order Received' ||
                                  order.status == 'Processing')
                              .toList();

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
                                colorHex: Color(int.parse(
                                    order.colorHex.replaceAll('#', '0xFF'))),
                                onViewOrder: () => Go.to(
                                  context,
                                  Pager.orderDetail(order.code),
                                ),
                              );
                            },
                          );
                        }

                        return const Center(
                          child: Text('Error loading orders'),
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
                          final completedOrders = state.orders
                              .where((order) => order.status == 'Delivered')
                              .toList();

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
                                colorHex: Color(int.parse(
                                    order.colorHex.replaceAll('#', '0xFF'))),
                                onViewOrder: () => Go.to(
                                  context,
                                  Pager.orderDetail(order.code),
                                ),
                              );
                            },
                          );
                        }

                        return const Center(
                          child: Text('Error loading orders'),
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
                          final cancelledOrders = state.orders
                              .where((order) => order.status == 'Cancelled')
                              .toList();

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
                                colorHex: Color(int.parse(
                                    order.colorHex.replaceAll('#', '0xFF'))),
                                onViewOrder: () => Go.to(
                                  context,
                                  Pager.orderDetail(order.code),
                                ),
                              );
                            },
                          );
                        }

                        return const Center(
                          child: Text('Error loading orders'),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomNavbar(),
    );
  }
}
