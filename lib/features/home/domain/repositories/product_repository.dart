import 'package:shopapp/core/resources/data_state.dart';

import '../entities/product.dart';

abstract class ProductRepository {
  Future<DataState<List<ProductEntity>>> getProducts();
}
