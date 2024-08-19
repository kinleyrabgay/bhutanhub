import 'package:bhutanhub/core/common/entities/brand.entity.dart';
import 'package:bhutanhub/core/common/entities/category.entity.dart';
import 'package:bhutanhub/core/constants/images.dart';
import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  const ProductEntity({
    required this.token,
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
    this.discountedPrice,
    this.termsAccepted,
  });

  final String token;
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
  final double? discountedPrice;
  final bool? termsAccepted;

  const ProductEntity.empty()
      : this(
          token: '',
          name: '',
          description: '',
          price: 0,
          image: const [BHImages.defaultPlaceholder],
          quantity: 0,
          category: const CategoryEntity.empty(),
          brand: const BrandEntity.empty(),
          condition: 'new',
          discount: 0.0,
          discountedPrice: 0.0,
        );

  @override
  List<Object?> get props => [
        token,
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
        discountedPrice,
      ];
}
