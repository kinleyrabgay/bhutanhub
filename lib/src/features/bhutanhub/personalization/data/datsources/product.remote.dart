import 'package:bhutanhub/core/errors/exception.dart';
import 'package:bhutanhub/core/services/api/v1/constant.dart';
import 'package:bhutanhub/src/features/bhutanhub/personalization/data/model/product.model.dart';
import 'package:http/http.dart' as http;

abstract class ProductRemoteDataSource {
  Future<void> createProduct({
    required ProductModel product,
  });
}

class ProductRemoteDataSourceImplementation implements ProductRemoteDataSource {
  const ProductRemoteDataSourceImplementation({
    required http.Client client,
  }) : _client = client;

  final http.Client _client;

  @override
  Future<void> createProduct({
    required ProductModel product,
  }) async {
    try {
      final response = await _client.post(
        Uri.http(
          APITestService.host,
          APITestService.product,
        ),
        headers: {
          'Content-Type': 'application/json',
        },
        body: product.toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Return success
        return;
      } else {
        // Return failure with APIException
        throw APIException(
          message: 'Failed to create product, please try again',
          statusCode: response.statusCode,
        );
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
