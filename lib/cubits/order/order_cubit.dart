import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_store/cubits/order/order_state.dart';

import '../../data/models/remote/request/order_create_request.dart';
import '../../data/repo/order_repo.dart';
import '../../utils/managers/internet_checker_manager.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderRepo _orderRepo;

  OrderCubit(this._orderRepo) : super(OrderInitial());

  Future<void> createOrder(OrderCreateRequest request) async {
    try {
      emit(OrderLoading());
      final hasInternet = await InternetCheckerManager.hasInternetConnection();
      if (!hasInternet) {
        emit(OrderError('No internet connection'));
        return;
      }

      final order = await _orderRepo.createOrder(request);
      emit(OrderSuccess(order));
    } on DioException catch (e) {
      emit(OrderError(e.message ?? 'An error occurred while creating order'));
    } catch (e) {
      emit(OrderError(e.toString()));
    }
  }

  Future<void> cancelOrder(String code) async {
    try {
      emit(OrderLoading());
      final hasInternet = await InternetCheckerManager.hasInternetConnection();
      if (!hasInternet) {
        emit(OrderError('No internet connection'));
        return;
      }

      await _orderRepo.cancelOrder(code);
      emit(OrderInitial());
    } on DioException catch (e) {
      emit(OrderError(e.message ?? 'An error occurred while canceling order'));
    } catch (e) {
      emit(OrderError(e.toString()));
    }
  }

  Future<void> checkPromoCode(String promoCode) async {
    try {
      emit(OrderLoading());
      final hasInternet = await InternetCheckerManager.hasInternetConnection();
      if (!hasInternet) {
        emit(OrderError('No internet connection'));
        return;
      }

      final response = await _orderRepo.checkPromoCode(promoCode);
      emit(PromoCodeSuccess(response));
    } on DioException catch (e) {
      emit(OrderError(e.message ?? 'An error occurred while checking promo code'));
    } catch (e) {
      emit(OrderError(e.toString()));
    }
  }

  Future<void> getOrderDetail(String code) async {
    try {
      emit(OrderLoading());
      final hasInternet = await InternetCheckerManager.hasInternetConnection();
      if (!hasInternet) {
        emit(OrderError('No internet connection'));
        return;
      }

      final order = await _orderRepo.getOrderDetail(code);
      emit(OrderSuccess(order));
    } on DioException catch (e) {
      emit(OrderError(e.message ?? 'An error occurred while getting order details'));
    } catch (e) {
      emit(OrderError(e.toString()));
    }
  }

  Future<void> getOrders() async {
    try {
      emit(OrderLoading());
      final hasInternet = await InternetCheckerManager.hasInternetConnection();
      if (!hasInternet) {
        emit(OrderError('No internet connection'));
        return;
      }

      final orders = await _orderRepo.getOrders();
      emit(OrderListSuccess(orders));
    } on DioException catch (e) {
      emit(OrderError(e.message ?? 'An error occurred while getting orders'));
    } catch (e) {
      emit(OrderError(e.toString()));
    }
  }

  Future<void> trackOrder(String orderCode) async {
    try {
      emit(OrderLoading());
      final hasInternet = await InternetCheckerManager.hasInternetConnection();
      if (!hasInternet) {
        emit(OrderError('No internet connection'));
        return;
      }

      final tracking = await _orderRepo.trackOrder(orderCode);
      emit(OrderTrackingSuccess(tracking));
    } on DioException catch (e) {
      emit(OrderError(e.message ?? 'An error occurred while tracking order'));
    } catch (e) {
      emit(OrderError(e.toString()));
    }
  }
}