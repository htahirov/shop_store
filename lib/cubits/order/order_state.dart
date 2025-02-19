import 'package:flutter/foundation.dart';

import '../../data/models/remote/response/order_detail_response.dart';
import '../../data/models/remote/response/order_response.dart';
import '../../data/models/remote/response/promo_code_response.dart';

@immutable
abstract class OrderState {}

class OrderInitial extends OrderState {}
class OrderLoading extends OrderState {}
class OrderSuccess extends OrderState {
  final OrderResponse order;
  OrderSuccess(this.order);
}
class OrderError extends OrderState {
  final String message;
  OrderError(this.message);
}
class OrderListSuccess extends OrderState {
  final List<OrderResponse> orders;
  OrderListSuccess(this.orders);
}
class PromoCodeSuccess extends OrderState {
  final PromoCodeResponse promoCode;
  PromoCodeSuccess(this.promoCode);
}
class OrderTrackingSuccess extends OrderState {
  final Map<String, String> tracking;
  OrderTrackingSuccess(this.tracking);
}
class OrderDetailSuccess extends OrderState {
  final OrderDetailResponse order;
  OrderDetailSuccess(this.order);
}