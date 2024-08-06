import 'package:equatable/equatable.dart';

class CategoryEntity {
  final int id;
  final String name;

  const CategoryEntity({
    required this.id,
    required this.name,
  });

  factory CategoryEntity.fromMap(Map<String, dynamic> map) {
    return CategoryEntity(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  const CategoryEntity.empty()
      : id = 0,
        name = '';
}

class BrandEntity {
  final int id;
  final String name;

  const BrandEntity({
    required this.id,
    required this.name,
  });

  factory BrandEntity.fromMap(Map<String, dynamic> map) {
    return BrandEntity(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  const BrandEntity.empty()
      : id = 0,
        name = '';
}

class ProductEntity extends Equatable {
  const ProductEntity({
    required this.uid,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.quantity,
    required this.category,
    required this.brand,
    required this.condition,
    this.sku,
    this.discount,
    this.weight,
    this.length,
    this.width,
    this.height,
    this.tags,
    this.availability,
    this.createdAt,
    this.updatedAt,
    this.averageRating,
    this.reviews,
  });

  final String uid;
  final String name;
  final String description;
  final double price;
  final List<String> image;
  final int quantity;
  final String condition;
  final CategoryEntity category;
  final BrandEntity brand;
  final String? sku;
  final double? discount;
  final double? weight;
  final double? length;
  final double? width;
  final double? height;
  final List<String>? tags;
  final String? availability;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final double? averageRating;
  final List<String>? reviews;

  const ProductEntity.empty()
      : this(
          uid: '',
          name: '',
          description: '',
          price: 0,
          image: const [],
          quantity: 0,
          category: const CategoryEntity.empty(),
          brand: const BrandEntity.empty(),
          condition: 'new',
        );

  @override
  List<Object?> get props => [
        uid,
        name,
        description,
        price,
        image,
        quantity,
        category,
        sku,
        brand,
        discount,
        weight,
        length,
        width,
        height,
        tags,
        availability,
        createdAt,
        updatedAt,
        averageRating,
        reviews,
      ];
}
