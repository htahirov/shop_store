import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/remote/request/basket_create_request.dart';
import '../../data/models/remote/request/basket_update_request.dart';
import '../../data/models/remote/response/basket_item_response.dart';
import '../../data/repo/basket_repo.dart';
import 'basket_state.dart';

class BasketCubit extends Cubit<BasketState> {
  final BasketRepo _basketRepo;
  List<BasketItem> _currentItems = [];
  Timer? _debounceTimer; // Add debounce timer

  BasketCubit(this._basketRepo) : super(BasketInitial());

  Future<void> getBasketItems() async {
    try {
      emit(BasketLoading());
      final items = await _basketRepo.getBasketItems();
      _currentItems = items;
      
      if (items.isEmpty) {
        emit(BasketSuccess(const []));
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

  // This method signals the UI to show the deletion loading state
  void startDeleting(String itemId) {
    // Create a copy of current items and mark the one being deleted
    final updatedItems = List<BasketItem>.from(_currentItems);
    emit(BasketItemDeleting(itemId, updatedItems));
  }

  Future<void> removeFromBasket(String id) async {
    try {
      // First, mark the item as being deleted to show loading indicator
      startDeleting(id);
      
      // Wait a short delay for UI to update
      await Future.delayed(const Duration(milliseconds: 500));
      
      // Perform the actual deletion
      await _basketRepo.deleteBasketItem(id);
      
      // Get updated basket items from server
      final newItems = await _basketRepo.getBasketItems();
      _currentItems = newItems;
      
      // Update the UI with the new basket state
      emit(BasketSuccess(newItems));
    } catch (e) {
      log('Deletion failed: $e');
      // Show error but keep current items
      emit(BasketError(e.toString()));
      // Emit success with current items to restore UI
      emit(BasketSuccess(_currentItems));
    }
  }

  // New method with debounce
  Future<void> updateBasketItemWithDebounce(String id, BasketUpdateRequest request) async {
    // Cancel previous timer if it exists
    _debounceTimer?.cancel();
    
    // Optimistically update the UI immediately
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
    }
    
    // Set a new timer for API call (2 seconds delay)
    _debounceTimer = Timer(const Duration(seconds: 2), () async {
      try {
        // Actually update the item on the server after debounce
        await _basketRepo.updateBasketItem(id, request);
        
        // Refresh basket items to sync with server
        final newItems = await _basketRepo.getBasketItems();
        _currentItems = newItems;
        emit(BasketSuccess(newItems));
      } catch (e) {
        log('Error updating basket item: $e');
        // If there's an error, restore original items
        emit(BasketError(e.toString()));
        emit(BasketSuccess(_currentItems));
      }
    });
  }

  // Keep original updateBasketItem for other use cases
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
      log('Error updating basket item: $e');
      emit(BasketSuccess(_currentItems));
    }
  }
  
  @override
  Future<void> close() {
    _debounceTimer?.cancel(); // Clean up timer when cubit is closed
    return super.close();
  }
}