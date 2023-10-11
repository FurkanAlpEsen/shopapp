import 'package:shopapp/core/resources/data_state.dart';
import 'package:shopapp/features/home/data/datasources/remote/product_service.dart';
import 'package:shopapp/features/home/domain/entities/product.dart';
import 'package:shopapp/features/home/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductService productService;

  ProductRepositoryImpl(this.productService);

  @override
  Future<DataState<List<ProductEntity>>> getProducts() async {
    try {
      final products = await productService.getProducts();

      return products;
    } catch (e) {
      throw "Unable to retrieve posts.";
    }
  }
}
