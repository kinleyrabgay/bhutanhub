import 'dart:convert';
import 'package:bhutanhub/core/utils/typedef.dart';
import 'package:bhutanhub/src/features/bhutanhub/personalization/domain/entities/product.entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.uid,
    required super.name,
    required super.description,
    required super.price,
    required super.image,
    required super.quantity,
    required super.categoryId,
  });

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  ProductModel.fromMap(DataMap map)
      : super(
          uid: map['uid'] ?? '',
          name: map['name'] ?? '',
          description: map['description'] ?? '',
          price: map['price']?.toDouble() ?? 0.0,
          image: map['image'] ?? '',
          quantity: map['quantity']?.toInt() ?? 0,
          categoryId: map['categoryId'] ?? '',
        );

  DataMap toMap() {
    return {
      'uid': uid,
      'name': name,
      'description': description,
      'price': price,
      'image': image,
      'quantity': quantity,
      'categoryId': categoryId,
    };
  }

  String toJson() => json.encode(toMap());

  ProductModel copyWith({
    String? name,
    String? description,
  }) {
    return ProductModel(
      uid: uid,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price,
      image: image,
      quantity: quantity,
      categoryId: categoryId,
    );
  }

  const ProductModel.empty()
      : super(
          uid: '',
          name: '',
          description: '',
          price: 0.0,
          image: '',
          quantity: 0,
          categoryId: '',
        );
}
