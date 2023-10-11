import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/basket/basket_bloc.dart';
import '../widgets/product_tile.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasketBloc, BasketState>(
      builder: (context, state) {
        double total = 0.0;
        state.products.forEach((element) {
          total = (total + element.price!);
        });
        return Container(
          color: Colors.black,
          child: Column(
            children: [
              Expanded(
                  child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: 15,
                ),
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  return ProductTile(product: state.products[index]);
                },
              )),
              Container(
                padding: EdgeInsets.all(5),
                color: Color.fromARGB(255, 32, 32, 32),
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Toplam',
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'TL',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${total}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                const Color.fromARGB(255, 52, 52, 52))),
                        onPressed: () {},
                        child: Text(
                          'Sepeti Onayla',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
