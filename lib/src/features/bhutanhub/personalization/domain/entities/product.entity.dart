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
  });

  final String uid;
  final String name;
  final String description;
  final double price;
  final String image;
  final int quantity;
  final String categoryId;

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
  List<Object?> get props => [name, description];
}
