import 'package:bhutanhub/core/usecase/usecase.dart';
import 'package:bhutanhub/core/utils/typedef.dart';
import 'package:bhutanhub/src/features/authentication/domain/entities/user.dart';
import 'package:bhutanhub/src/features/authentication/domain/repositories/authentication.dart';

class GoogleSSO extends UsecaseWithoutParam<void> {
  const GoogleSSO(this._repo);

  final AuthenticationRepository _repo;

  @override
  ResultFuture<UserEntity> call() => _repo.googleSSO();
}
