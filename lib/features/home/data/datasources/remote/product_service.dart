import 'package:http/http.dart';
import 'package:shopapp/core/constants/constants.dart';
import 'package:shopapp/core/resources/data_state.dart';
import 'dart:convert';

import '../../models/product.dart';

abstract class RemoteProductSource {
  Future<DataState<List<Product>>> getProducts();
}

class ProductService implements RemoteProductSource {
  var url = Uri.parse(productsAPIBaseURL);

  Future<DataState<List<Product>>> getProducts() async {
    try {
      final response = await get(url);

      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);

        List<Product> products = body
            .map(
              (dynamic item) => Product.fromJson(item),
            )
            .toList();

        return DataSuccess(products);
      } else {
        return DataFailed(response as String);
      }
    } catch (e) {
      return DataFailed(e as String);
    }
  }
}
