import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopapp/core/resources/data_state.dart';
import 'package:shopapp/features/home/domain/entities/product.dart';
import 'package:shopapp/features/home/domain/usecases/get_products.dart';

part 'remote_products_event.dart';
part 'remote_products_state.dart';

class RemoteProductsBloc
    extends Bloc<RemoteProductsEvent, RemoteProductsState> {
  final GetProductsUseCase _getProductsUseCase;

  RemoteProductsBloc(this._getProductsUseCase)
      : super(const RemoteProductsInitial()) {
    on<GetProducts>(onGetProducts);
  }

  void onGetProducts(
      GetProducts event, Emitter<RemoteProductsState> emit) async {
    final dataState = await _getProductsUseCase.execute();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteProductsDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(RemoteProductError(dataState.exception!));
    }
  }
}
