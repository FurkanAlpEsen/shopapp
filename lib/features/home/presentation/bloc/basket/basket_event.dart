part of 'basket_bloc.dart';

sealed class BasketEvent extends Equatable {
  const BasketEvent();

  @override
  List<Object> get props => [];
}

class AddBasket extends BasketEvent {
  final ProductEntity entity;
  const AddBasket(this.entity);
}

class RemoveBasket extends BasketEvent {
  final ProductEntity entity;
  const RemoveBasket(this.entity);
}
