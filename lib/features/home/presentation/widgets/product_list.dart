import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/features/home/presentation/bloc/basket/basket_bloc.dart';
import 'package:shopapp/features/home/presentation/bloc/home/home_bloc.dart';
import 'package:shopapp/features/home/presentation/bloc/remote/remote_products_bloc.dart';

import 'product_tile.dart';

class ProductList extends StatefulWidget {
  ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: _buildBody(),
        floatingActionButton: _floatingActionButton());
  }

  _buildBody() {
    return BlocBuilder<RemoteProductsBloc, RemoteProductsState>(
      builder: (context, state) {
        if (state is RemoteProductsInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is RemoteProductError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'No connection \n ${state.error.runtimeType}',
                  style: TextStyle(color: Colors.white),
                ),
                Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
              ],
            ),
          );
        }
        if (state is RemoteProductsDone) {
          return Column(
            children: [
              Expanded(
                  child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: 15,
                ),
                itemCount: state.products!.length,
                itemBuilder: (context, index) {
                  return ProductTile(product: state.products![index]);
                },
              )),
            ],
          );
        }
        return SizedBox.shrink();
      },
    );
  }

  Widget _floatingActionButton() {
    return BlocBuilder<BasketBloc, BasketState>(
      builder: (context, state) {
        return FloatingActionButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(40))),
          onPressed: () {
            BlocProvider.of<HomeBloc>(context)..add(HomeEvent(3));
          },
          backgroundColor: Colors.black,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topRight,
            children: [
              Icon(
                Icons.shopping_basket_outlined,
                color: Colors.white,
                size: 22,
              ),
              Positioned(
                bottom: 15,
                left: 10,
                child: Container(
                  height: 19,
                  width: 19,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(40)),
                  child: Text(
                    textAlign: TextAlign.center,
                    '${state.products.length}',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
