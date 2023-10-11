part of 'remote_products_bloc.dart';

abstract class RemoteProductsState extends Equatable {
  const RemoteProductsState({this.products, this.error});

  final List<ProductEntity>? products;
  final String? error;

  @override
  List<Object> get props => [products!, error!];
}

class RemoteProductsInitial extends RemoteProductsState {
  const RemoteProductsInitial();
}

class RemoteProductsDone extends RemoteProductsState {
  const RemoteProductsDone(List<ProductEntity> product)
      : super(products: product);
}

class RemoteProductError extends RemoteProductsState {
  const RemoteProductError(String error) : super(error: error);
}
