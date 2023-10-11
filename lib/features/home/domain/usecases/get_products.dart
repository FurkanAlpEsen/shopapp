import 'package:shopapp/core/resources/data_state.dart';
import 'package:shopapp/features/home/domain/entities/product.dart';
import 'package:shopapp/features/home/domain/repositories/product_repository.dart';

class GetProductsUseCase {
  final ProductRepository productRepository;
  GetProductsUseCase(this.productRepository);

  Future<DataState<List<ProductEntity>>> execute() async =>
      await productRepository.getProducts();
}
