import 'dart:convert';
import 'package:bhutanhub/core/common/entities/brand.entity.dart';
import 'package:bhutanhub/core/common/entities/category.entity.dart';
import 'package:bhutanhub/core/common/entities/product.entity.dart';
import 'package:bhutanhub/core/utils/typedef.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.uid,
    required super.name,
    required super.description,
    required super.price,
    required super.image,
    required super.quantity,
    required super.category,
    required super.brand,
    required super.condition,
    super.discount,
    super.discountedPrice,
  });

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  ProductModel.fromMap(DataMap map)
      : super(
          uid: map['uid'] ?? '',
          name: map['name'] ?? '',
          description: map['description'] ?? '',
          price: (map['price'] as num?)?.toDouble() ?? 0.0,
          image: List<String>.from(map['image'] ?? const []),
          quantity: (map['quantity'] as num?)?.toInt() ?? 0,
          category: CategoryEntity.fromMap(map['category'] ?? const {}),
          brand: BrandEntity.fromMap(map['brand'] ?? const {}),
          condition: map['condition'] ?? 'new',
          discount: (map['discount'] as num?)?.toDouble() ?? 0.0,
          discountedPrice: (map['discountedPrice'] as num).toDouble(),
        );

  DataMap toMap() {
    return {
      'uid': uid,
      'name': name,
      'description': description,
      'price': price,
      'image': image,
      'quantity': quantity,
      'category': category.toMap(),
      'brand': brand.toMap(),
      'condition': condition,
      'discount': discount,
      'discountedPrice': discountedPrice,
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
      category: category,
      brand: brand,
      condition: condition,
      discount: discount,
      discountedPrice: discountedPrice,
    );
  }

  const ProductModel.empty()
      : super(
          uid: '',
          name: '',
          description: '',
          price: 0.0,
          image: const [],
          quantity: 0,
          category: const CategoryEntity.empty(),
          brand: const BrandEntity.empty(),
          condition: 'new',
          discount: 0.0,
          discountedPrice: 0.0,
        );
}
