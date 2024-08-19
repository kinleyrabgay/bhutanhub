import 'package:bhutanhub/core/usecase/usecase.dart';
import 'package:bhutanhub/core/utils/typedef.dart';
import 'package:bhutanhub/src/features/authentication/domain/repositories/authentication.dart';

class Logout extends UsecaseWithoutParam<void> {
  const Logout(this._repo);

  final AuthenticationRepository _repo;

  @override
  ResultFuture<void> call() => _repo.logout();
}
