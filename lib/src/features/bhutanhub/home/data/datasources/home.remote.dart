import 'package:bhutanhub/core/common/models/product.model.dart';
import 'package:bhutanhub/core/errors/exception.dart';
import 'package:bhutanhub/core/services/api/v1/constant.dart';
import 'package:dio/dio.dart';

abstract class HomeRemoteDatasource {
  const HomeRemoteDatasource();

  Future<List<ProductModel>> fetchProducts({
    required String key,
    required String subKey,
  });
}

class HomeRemoteDatasourceImplementation implements HomeRemoteDatasource {
  const HomeRemoteDatasourceImplementation({
    required Dio dio,
  }) : _dio = dio;

  final Dio _dio;

  @override
  Future<List<ProductModel>> fetchProducts({
    required String key,
    required String subKey,
  }) async {
    try {
      final response = await _dio.get(
        APITestService.product,
        queryParameters: {
          'key': key,
          'subKey': subKey,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final products = (response.data['data'] as List)
            .map((product) => ProductModel.fromMap(product))
            .toList();
        return products;
      }

      return [];
    } catch (e) {
      throw APIException(
        message: 'Failed to fetch products: ${e.toString()}',
        statusCode: 500,
      );
    }
  }
}
