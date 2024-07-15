class APIService {
  APIService._();

  static const String host = 'https://bhutanhub.vercel.app/api/v1';
  static const String scheme = 'https';
  static const String basePath = '/api/v1';

  static const String baseProduct = '$basePath/products';
  static const String uploadProductImage = '$host/file-uploader';
}

class APITestService {
  APITestService._();

  static const String host = 'http://localhost:3000/api/v1';
  static const String scheme = 'http';
  static const String basePath = '/api/v1';

  static const String product = '$host/products';
  static const String uploadProductImage = '$host/file-uploader';
}
