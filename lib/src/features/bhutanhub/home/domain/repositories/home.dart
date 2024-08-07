import 'package:bhutanhub/core/common/entities/product.entity.dart';
import 'package:bhutanhub/core/utils/typedef.dart';

abstract class HomeRepository {
  const HomeRepository();

  // Fetch products
  ResultFuture<List<ProductEntity>> fetchProducts({
    required String key,
    required String subKey,
  });
}
