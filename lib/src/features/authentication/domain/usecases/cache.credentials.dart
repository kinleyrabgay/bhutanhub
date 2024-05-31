import 'package:bhutan_hub/core/usecase/usecase.dart';
import 'package:bhutan_hub/core/utils/typedef.dart';
import 'package:bhutan_hub/src/features/authentication/domain/repositories/authentication.dart';

class CacheCredentials extends UsecaseWithoutParam<void> {
  const CacheCredentials(this._repo);

  final AuthenticationRepository _repo;

  @override
  ResultFuture call() async => _repo.cacheCredentials(
        email: '',
        password: '',
      );
}
