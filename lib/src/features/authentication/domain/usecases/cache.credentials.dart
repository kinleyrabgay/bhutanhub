import 'package:bhutanhub/core/usecase/usecase.dart';
import 'package:bhutanhub/core/utils/typedef.dart';
import 'package:bhutanhub/src/features/authentication/domain/repositories/authentication.dart';

class CacheCredentials extends UsecaseWithoutParam<void> {
  const CacheCredentials(this._repo);

  final AuthenticationRepository _repo;

  @override
  ResultFuture call() async => _repo.cacheCredentials(
        email: '',
        password: '',
      );
}
