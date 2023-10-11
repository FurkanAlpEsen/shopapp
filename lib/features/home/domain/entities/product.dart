import 'package:equatable/equatable.dart';

import '../../data/models/rating.dart';

class ProductEntity extends Equatable {
  final int? id;
  final String? title;
  final double? price;
  final String? category;
  final String? description;
  final String? image;
  final Rating? rating;

  const ProductEntity(
      {this.id,
      this.title,
      this.price,
      this.category,
      this.description,
      this.image,
      this.rating});

  @override
  List<Object?> get props {
    return [id, title, price, category, description, image, rating];
  }
}
