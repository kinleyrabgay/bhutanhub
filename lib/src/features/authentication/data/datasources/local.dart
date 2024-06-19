import 'package:bhutanhub/core/errors/exception.dart';
import 'package:bhutanhub/core/store/store.dart';

abstract class AutheLocalDataSource {
  const AutheLocalDataSource();

  Future<void> cacheCredentials({
    required String email,
    required String password,
  });
}

// Universal key constants
const kEmailKey = 'email';
const kPasswordKey = 'password';

class AutheLocalDataSourceImplementation extends AutheLocalDataSource {
  const AutheLocalDataSourceImplementation({
    required StorageService storageService,
  }) : _storageService = storageService;

  final StorageService _storageService;

  @override
  Future<void> cacheCredentials(
      {required String email, required String password}) async {
    try {
      await _storageService.saveString(kEmailKey, email);
      await _storageService.saveString(kPasswordKey, password);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}
