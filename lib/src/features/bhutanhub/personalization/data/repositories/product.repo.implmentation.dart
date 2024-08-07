import 'package:bhutanhub/core/common/entities/product.entity.dart';
import 'package:bhutanhub/core/common/models/product.model.dart';
import 'package:bhutanhub/core/errors/exception.dart';
import 'package:bhutanhub/core/errors/failure.dart';
import 'package:bhutanhub/core/utils/typedef.dart';
import 'package:bhutanhub/src/features/bhutanhub/personalization/data/datsources/product.remote.dart';
import 'package:bhutanhub/src/features/bhutanhub/personalization/domain/repositories/product.dart';
import 'package:dartz/dartz.dart';

class ProductRepositoryImplementation implements ProductRepository {
  const ProductRepositoryImplementation({required this.remoteDataSource});

  final ProductRemoteDataSource remoteDataSource;

  @override
  ResultFuture<void> createProduct({
    required ProductEntity product,
  }) async {
    try {
      final productModel = ProductModel(
        uid: product.uid,
        name: product.name,
        description: product.description,
        price: product.price,
        image: product.image,
        quantity: product.quantity,
        category: product.category,
        brand: product.brand,
        condition: product.condition,
      );
      await remoteDataSource.createProduct(
        product: productModel,
      );
      return const Right(null);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }
}
