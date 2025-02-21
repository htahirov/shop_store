import 'package:flutter/material.dart';

import '../../data/models/remote/response/basket_item_response.dart';

@immutable
abstract class BasketState {}

class BasketInitial extends BasketState {}

class BasketLoading extends BasketState {}

class BasketSuccess extends BasketState {
  final List<BasketItem> items;
  BasketSuccess(this.items);
}

class BasketError extends BasketState {
  final String message;
  BasketError(this.message);
}

class BasketOperationSuccess extends BasketState {}

// Updated state to include current items while deleting
class BasketItemDeleting extends BasketState {
  final String itemId;
  final List<BasketItem> currentItems;
  
  BasketItemDeleting(this.itemId, this.currentItems);
  
  // Helper method to get properly typed items
  List<BasketItem> get items => currentItems;
}