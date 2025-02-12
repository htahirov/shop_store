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