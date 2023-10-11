import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopapp/features/home/domain/entities/product.dart';

part 'basket_event.dart';
part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  BasketBloc(super.initialState) {
    on<AddBasket>(onAddBasket);
    on<RemoveBasket>(onRemoveBasket);
  }

  void onAddBasket(AddBasket event, Emitter<BasketState> emit) async {
    emit(BasketState(products: List.from(state.products)..add(event.entity)));
  }

  void onRemoveBasket(RemoveBasket event, Emitter<BasketState> emit) async {
    emit(
        BasketState(products: List.from(state.products)..remove(event.entity)));
  }
}
