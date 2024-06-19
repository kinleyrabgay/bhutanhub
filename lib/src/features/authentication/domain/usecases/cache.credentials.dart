import 'package:bhutanhub/core/usecase/usecase.dart';
import 'package:bhutanhub/core/utils/typedef.dart';
import 'package:bhutanhub/src/features/authentication/domain/repositories/authentication.dart';
import 'package:equatable/equatable.dart';

class CacheCredentials extends UsecaseWithParam<void, CacheCredentialsParams> {
  const CacheCredentials(this._repo);

  final AuthenticationRepository _repo;

  @override
  ResultFuture call(CacheCredentialsParams params) async =>
      _repo.cacheCredentials(
        email: params.email,
        password: params.password,
      );
}

class CacheCredentialsParams extends Equatable {
  const CacheCredentialsParams({
    required this.email,
    required this.password,
  });

  const CacheCredentialsParams.empty()
      : email = '',
        password = '';

  final String email;
  final String password;

  @override
  List<String> get props => [email, password];
}
