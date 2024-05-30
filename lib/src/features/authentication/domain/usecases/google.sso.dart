import 'package:bhutan_hub/core/usecase/usecase.dart';
import 'package:bhutan_hub/core/utils/typedef.dart';
import 'package:bhutan_hub/src/features/authentication/domain/repositories/authentication.dart';

class GoogleSSO extends UsecaseWithoutParam<void> {
  const GoogleSSO(this._repo);

  final AuthenticationRepository _repo;

  @override
  ResultFuture<void> call() => _repo.googleSSO();
}
