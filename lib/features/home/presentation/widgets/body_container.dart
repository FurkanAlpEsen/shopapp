import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/features/home/presentation/pages/basket.dart';
import 'package:shopapp/features/home/presentation/widgets/product_list.dart';

import '../bloc/home/home_bloc.dart';

class BodyContainer extends StatelessWidget {
  BodyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        switch (state.posIndex) {
          case 0:
            return Column(
              children: [
                Expanded(child: ProductList()),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'assets/images/ads.png',
                    fit: BoxFit.fitWidth,
                  ),
                )
              ],
            );

          case 1:
            return Container(
              color: Colors.blue,
            );
          case 2:
            return Container(
              color: Colors.red,
            );
          case 3:
            return BasketPage();
          // case 4:
          //   return ProductDetail();
          default:
            return Container(
              color: Colors.yellow,
            );
        }
      },
    );
  }
}
