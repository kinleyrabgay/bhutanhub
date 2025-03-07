import 'package:bhutanhub/core/common/models/product.model.dart';
import 'package:bhutanhub/core/errors/exception.dart';
import 'package:bhutanhub/core/services/api/v1/constant.dart';
import 'package:dio/dio.dart';

abstract class ProductRemoteDataSource {
  Future<void> createProduct({
    required ProductModel product,
  });
}

class ProductRemoteDataSourceImplementation implements ProductRemoteDataSource {
  const ProductRemoteDataSourceImplementation({
    required Dio dio,
  }) : _dio = dio;

  final Dio _dio;

  @override
  Future<void> createProduct({
    required ProductModel product,
  }) async {
    try {
      final response = await _dio.post(
        APITestService.product,
        data: product.toJson(),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Return success
        return;
      }
    } catch (e) {
      // Return failure with APIException for exceptions
      throw APIException(
        message: 'Failed to create product: ${e.toString()}',
        statusCode: 500,
      );
    }
  }
}
