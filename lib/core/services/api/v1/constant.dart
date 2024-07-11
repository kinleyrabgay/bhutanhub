class APIService {
  APIService._();

  static const String host = 'bhutanhub.vercel.app';
  static const String scheme = 'https';
  static const String basePath = '/api/v1';

  static const String product = '$basePath/products';
}

class APITestService {
  APITestService._();

  static const String host = 'localhost:3000';
  static const String scheme = 'http';
  static const String basePath = '/api/v1';

  static const String greeting = basePath;
  static const String product = '$basePath/products';
}
