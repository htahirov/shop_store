import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/remote/request/basket_create_request.dart';
import '../../data/models/remote/request/basket_update_request.dart';
import '../../data/models/remote/response/basket_item_response.dart';
import '../../data/repo/basket_repo.dart';
import 'basket_state.dart';


class BasketCubit extends Cubit<BasketState> {
  final BasketRepo _basketRepo;
  List<BasketItem> _currentItems = [];

  BasketCubit(this._basketRepo) : super(BasketInitial());

  Future<void> getBasketItems() async {
    try {
      emit(BasketLoading());
      final items = await _basketRepo.getBasketItems();
      _currentItems = items;
      
      if (items.isEmpty) {
        emit(BasketSuccess([]));
      } else {
        emit(BasketSuccess(items));
      }
    } catch (e) {
      emit(BasketError(e.toString()));
    }
  }

  Future<void> addToBasket({
    required int productId,
    required int colorId,
    required int sizeId,
    required int quantity,
  }) async {
    try {
      final request = BasketCreateRequest(
        product: productId,
        color: colorId,
        size: sizeId,
        quantity: quantity,
      );
      
      emit(BasketSuccess(_currentItems));
      await _basketRepo.createBasketItem(request);
      final newItems = await _basketRepo.getBasketItems();
      _currentItems = newItems;
      emit(BasketSuccess(newItems));
    } catch (e) {
      emit(BasketError(e.toString()));
    }
  }

  Future<void> removeFromBasket(String id) async {
    try {
      final currentItems = _currentItems.where((item) => item.id.toString() != id).toList();
      emit(BasketSuccess(currentItems));
      
      await _basketRepo.deleteBasketItem(id);
      final newItems = await _basketRepo.getBasketItems();
      _currentItems = newItems;
      emit(BasketSuccess(newItems));
    } catch (e) {
      emit(BasketError(e.toString()));
      emit(BasketSuccess(_currentItems));
    }
  }

  Future<void> updateBasketItem(String id, BasketUpdateRequest request) async {
    try {
      final itemIndex = _currentItems.indexWhere((item) => item.id.toString() == id);
      if (itemIndex != -1) {
        final currentItem = _currentItems[itemIndex];
        final updatedItems = List<BasketItem>.from(_currentItems);
        
        // Update the item while maintaining the original structure
        updatedItems[itemIndex] = BasketItem(
          id: currentItem.id,
          name: currentItem.name,
          image: currentItem.image,
          quantity: request.quantity,
          colorChoices: currentItem.colorChoices,
          totalPrice: currentItem.totalPrice,
          // Keep existing values if not being updated
          productColor: currentItem.productColor,
          productSize: currentItem.productSize,
          sizeChoices: currentItem.sizeChoices,
        );

        // Show immediate update
        _currentItems = updatedItems;
        emit(BasketSuccess(updatedItems));
        
        // Update in background
        await _basketRepo.updateBasketItem(id, request);
        final newItems = await _basketRepo.getBasketItems();
        _currentItems = newItems;
        emit(BasketSuccess(newItems));
      }
    } catch (e) {
      emit(BasketSuccess(_currentItems));
    }
  }
}