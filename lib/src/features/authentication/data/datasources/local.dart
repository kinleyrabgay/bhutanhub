import 'package:bhutanhub/core/constants/keys.dart';
import 'package:bhutanhub/core/errors/exception.dart';
import 'package:bhutanhub/core/store/store.dart';

abstract class AutheLocalDataSource {
  const AutheLocalDataSource();

  Future<void> cacheCredentials({
    required String email,
    required String password,
  });
}

class AutheLocalDataSourceImplementation extends AutheLocalDataSource {
  const AutheLocalDataSourceImplementation({
    required StorageService storageService,
  }) : _storageService = storageService;

  final StorageService _storageService;

  @override
  Future<void> cacheCredentials({
    required String email,
    required String password,
  }) async {
    print(email);
    try {
      await _storageService.saveString(ConstantKeys.rememberEmail, email);
      await _storageService.saveString(ConstantKeys.rememberPassword, password);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}
