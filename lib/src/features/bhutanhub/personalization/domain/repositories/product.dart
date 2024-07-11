import 'package:bhutanhub/core/utils/typedef.dart';
import 'package:bhutanhub/src/features/bhutanhub/personalization/domain/entities/product.entity.dart';

abstract class ProductRepository {
  const ProductRepository();

  // Create Product
  ResultFuture<void> createProduct({
    required ProductEntity product,
  });
}
