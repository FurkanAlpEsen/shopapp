part of 'remote_products_bloc.dart';

abstract class RemoteProductsEvent {
  const RemoteProductsEvent();
}

class GetProducts extends RemoteProductsEvent {
  const GetProducts();
}
