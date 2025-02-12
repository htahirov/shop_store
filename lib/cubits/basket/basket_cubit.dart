import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/remote/request/basket_create_request.dart';
import '../../data/models/remote/request/basket_update_request.dart';
import '../../data/repo/basket_repo.dart';
import 'basket_state.dart';

class BasketCubit extends Cubit<BasketState> {
  final BasketRepo _basketRepo;

  BasketCubit(this._basketRepo) : super(BasketInitial());

  Future<void> getBasketItems() async {
    try {
      emit(BasketLoading());
      final items = await _basketRepo.getBasketItems();
      emit(BasketSuccess(items));
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
      emit(BasketLoading());
      final request = BasketCreateRequest(
        product: productId,
        color: colorId,
        size: sizeId,
        quantity: quantity,
      );
      await _basketRepo.createBasketItem(request);
      await getBasketItems();
      emit(BasketOperationSuccess());
    } catch (e) {
      emit(BasketError(e.toString()));
    }
  }

  Future<void> removeFromBasket(String id) async {
    try {
      emit(BasketLoading());
      await _basketRepo.deleteBasketItem(id);
      await getBasketItems();
      emit(BasketOperationSuccess());
    } catch (e) {
      emit(BasketError(e.toString()));
    }
  }

  Future<void> updateBasketItemQuantity(String id, int quantity) async {
    try {
      emit(BasketLoading());
      final request = BasketUpdateRequest(quantity: quantity);
      await _basketRepo.updateBasketItem(id, request);
      await getBasketItems();
      emit(BasketOperationSuccess());
    } catch (e) {
      emit(BasketError(e.toString()));
    }
  }
}