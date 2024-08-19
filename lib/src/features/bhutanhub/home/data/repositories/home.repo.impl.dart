import 'package:bhutanhub/core/common/entities/product.entity.dart';
import 'package:bhutanhub/core/errors/exception.dart';
import 'package:bhutanhub/core/errors/failure.dart';
import 'package:bhutanhub/core/utils/typedef.dart';
import 'package:bhutanhub/src/features/bhutanhub/home/data/datasources/home.remote.dart';
import 'package:bhutanhub/src/features/bhutanhub/home/domain/repositories/home.dart';
import 'package:dartz/dartz.dart';

class HomeRepositoryImplementation implements HomeRepository {
  const HomeRepositoryImplementation({
    required HomeRemoteDatasource remote,
  }) : _remote = remote;

  final HomeRemoteDatasource _remote;

  @override
  ResultFuture<List<ProductEntity>> fetchProducts({
    required String key,
    required String subKey,
  }) async {
    try {
      final products = await _remote.fetchProducts(
        key: key,
        subKey: subKey,
      );

      final productsEntity = products
          .map(
            (product) => ProductEntity(
                token: product.token,
                name: product.name,
                description: product.description,
                price: product.price,
                image: product.image,
                quantity: product.quantity,
                category: product.category,
                brand: product.brand,
                condition: product.condition,
                discount: product.discount,
                discountedPrice: product.discountedPrice),
          )
          .toList();
      return Right(productsEntity);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }
}
