import '../models/remote/request/order_create_request.dart';
import '../models/remote/response/order_response.dart';
import '../models/remote/response/promo_code_response.dart';
import '../repo/order_repo.dart';
import '../services/remote/order_service.dart';

class OrderRepoImpl implements OrderRepo {
  final OrderService _orderService;

  OrderRepoImpl(this._orderService);

  @override
  Future<OrderResponse> createOrder(OrderCreateRequest request) => 
      _orderService.createOrder(request);

  @override
  Future<void> cancelOrder(String code) => 
      _orderService.cancelOrder(code);

  @override
  Future<PromoCodeResponse> checkPromoCode(String promoCode) => 
      _orderService.checkPromoCode(promoCode);

  @override
  Future<OrderResponse> getOrderDetail(String code) => 
      _orderService.getOrderDetail(code);

  @override
  Future<List<OrderResponse>> getOrders() => 
      _orderService.getOrders();

  @override
  Future<Map<String, String>> trackOrder(String orderCode) => 
      _orderService.trackOrder(orderCode);
}