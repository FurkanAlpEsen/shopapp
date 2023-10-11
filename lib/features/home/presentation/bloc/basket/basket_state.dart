part of 'basket_bloc.dart';

class BasketState extends Equatable {
  const BasketState({required this.products});

  final List<ProductEntity> products;

  @override
  List<Object> get props => [products];
}
