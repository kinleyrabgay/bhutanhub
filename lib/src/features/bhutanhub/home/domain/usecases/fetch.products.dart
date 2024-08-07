import 'package:bhutanhub/core/common/entities/product.entity.dart';
import 'package:bhutanhub/core/usecase/usecase.dart';
import 'package:bhutanhub/core/utils/typedef.dart';
import 'package:bhutanhub/src/features/bhutanhub/home/domain/repositories/home.dart';
import 'package:equatable/equatable.dart';

class FetchProduct
    extends UsecaseWithParam<List<ProductEntity>, FetchProductParams> {
  const FetchProduct(this._repo);
  final HomeRepository _repo;

  @override
  ResultFuture<List<ProductEntity>> call(params) => _repo.fetchProducts(
        key: params.key,
        subKey: params.subKey,
      );
}

class FetchProductParams extends Equatable {
  const FetchProductParams({
    required this.key,
    required this.subKey,
  });

  final String key;
  final String subKey;

  @override
  List<Object?> get props => [key, subKey];
}
