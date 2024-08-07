import 'package:bhutanhub/core/common/entities/product.entity.dart';
import 'package:bhutanhub/core/utils/typedef.dart';

abstract class ProductRepository {
  const ProductRepository();

  // Create Product
  ResultFuture<void> createProduct({
    required ProductEntity product,
  });
}
