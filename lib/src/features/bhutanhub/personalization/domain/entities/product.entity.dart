import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  const ProductEntity({
    required this.uid,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.quantity,
    required this.categoryId,
    this.sku,
    this.brand,
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
  final String image;
  final int quantity;
  final String categoryId;
  final String? sku;
  final String? brand;
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
          image: '',
          quantity: 0,
          categoryId: '',
        );

  @override
  List<Object?> get props => [
        uid,
        name,
        description,
        price,
        image,
        quantity,
        categoryId,
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
