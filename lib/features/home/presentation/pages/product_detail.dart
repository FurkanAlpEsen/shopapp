import 'package:flutter/material.dart';
import 'package:shopapp/features/home/domain/entities/product.dart';

//! Detail normal sayfa olarak degil bottom nav icinde liste gibi gorunecek.
//? Direk sayfa olarak navigate islemi gecici
class ProductDetail extends StatelessWidget {
  ProductDetail({super.key, this.product});

  ProductEntity? product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 70,
            ),
            Container(
                decoration: BoxDecoration(color: Colors.transparent),
                width: MediaQuery.of(context).size.width - 20,
                height: MediaQuery.of(context).size.height / 3,
                child: Image.network(
                  '${product!.image}',
                  fit: BoxFit.scaleDown,
                )),
            Text(
              '${product!.title}',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Text(
              '${product!.description}',
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
