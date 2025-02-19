import '../models/remote/request/order_create_request.dart';
import '../models/remote/response/order_response.dart';
import '../models/remote/response/promo_code_response.dart';

abstract class OrderRepo {
  Future<OrderResponse> createOrder(OrderCreateRequest request);
  Future<void> cancelOrder(String code);
  Future<PromoCodeResponse> checkPromoCode(String promoCode);
  Future<OrderResponse> getOrderDetail(String code);
  Future<List<OrderResponse>> getOrders();
  Future<Map<String, String>> trackOrder(String orderCode);
}