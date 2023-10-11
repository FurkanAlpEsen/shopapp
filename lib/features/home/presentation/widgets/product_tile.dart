import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/features/home/presentation/bloc/basket/basket_bloc.dart';

import 'package:shopapp/features/home/presentation/pages/product_detail.dart';

import '../../domain/entities/product.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({super.key, this.product});

  final ProductEntity? product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductDetail(
                    product: product,
                  )),
        );
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            height: MediaQuery.of(context).size.height / 9,
            width: MediaQuery.of(context).size.width - 50,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        height: 70,
                        width: 70,
                        child: Image.network('${product!.image}',
                            fit: BoxFit.contain),
                      ),
                      Positioned(
                        left: 45,
                        top: 45,
                        child: GestureDetector(
                          onTap: () {
                            print('liked item');
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(40)),
                            child: Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            maxLines: 1,
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                            '${product!.title}',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'Black',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Row(
                            children: [
                              Text(
                                'TL',
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${product!.price}',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w700),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      GestureDetector(
                          onTap: () {
                            // sl()..add();
                            context.read<BasketBloc>()
                              ..add(AddBasket(product!));

                            // print(
                            //     '${context.read<BasketBloc>().state.products.length}');

                            // print('sepete eklendi');
                          },
                          child: Icon(Icons.add_circle_outline)),
                      Text('1'),
                      GestureDetector(
                          onTap: () {
                            context.read<BasketBloc>()
                              ..add(RemoveBasket(product!));
                            // print('sepetten cikarildi');
                          },
                          child: Icon(Icons.remove_circle_outline))
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
