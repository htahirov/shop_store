import '../models/remote/request/basket_create_request.dart';
import '../models/remote/request/basket_update_request.dart';
import '../models/remote/response/basket_item_response.dart';

abstract class BasketRepo {
  Future<void> createBasketItem(BasketCreateRequest request);
  Future<void> deleteBasketItem(String id);
  Future<List<BasketItem>> getBasketItems();
  Future<BasketItem> updateBasketItem(String id, BasketUpdateRequest request);
}
