class APIService {
  APIService._();

  static const String host = 'https://bhutanhub.vercel.app/api/v1';

  static const String product = '$host/products';
  static const String uploadProductImage = '$host/file-uploader';
}

class APITestService {
  APITestService._();

  static const String host = 'http://localhost:3000/api/v1';

  static const String _baseAuthentication = '$host/authentication';

  static const String login = '$_baseAuthentication/login';
  static const String register = '$_baseAuthentication/register';

  static const String product = '$host/products';
  static const String uploadProductImage = '$host/file-uploader';
}
