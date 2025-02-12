import '../models/remote/request/basket_create_request.dart';
import '../models/remote/request/basket_update_request.dart';
import '../models/remote/response/basket_item_response.dart';
import '../repo/basket_repo.dart';
import '../services/remote/basket_service.dart';

class BasketRepoImpl implements BasketRepo {
  final BasketService _basketService;

  BasketRepoImpl(this._basketService);

  @override
  Future<void> createBasketItem(BasketCreateRequest request) => 
      _basketService.createBasketItem(request);

  @override
  Future<void> deleteBasketItem(String id) => 
      _basketService.deleteBasketItem(id);

  @override
  Future<List<BasketItem>> getBasketItems() => 
      _basketService.getBasketItems();

  @override
  Future<BasketItem> updateBasketItem(String id, BasketUpdateRequest request) => 
      _basketService.updateBasketItem(id, request);
}