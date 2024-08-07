import 'package:bhutanhub/core/common/entities/product.entity.dart';
import 'package:bhutanhub/core/usecase/usecase.dart';
import 'package:bhutanhub/core/utils/typedef.dart';
import 'package:bhutanhub/src/features/bhutanhub/personalization/domain/repositories/product.dart';
import 'package:equatable/equatable.dart';

class CreateProduct extends UsecaseWithParam<void, CreateProductParams> {
  const CreateProduct(this._repo);
  final ProductRepository _repo;

  @override
  ResultFuture<void> call(params) => _repo.createProduct(
        product: params.product,
      );
}

class CreateProductParams extends Equatable {
  const CreateProductParams({required this.product});

  final ProductEntity product;

  @override
  List<Object?> get props => [product];
}
