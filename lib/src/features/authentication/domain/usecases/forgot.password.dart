import 'package:bhutanhub/core/usecase/usecase.dart';
import 'package:bhutanhub/core/utils/typedef.dart';
import 'package:bhutanhub/src/features/authentication/domain/repositories/authentication.dart';

class ForgotPassword extends UsecaseWithParam<void, String> {
  const ForgotPassword(this._repo);

  final AuthenticationRepository _repo;

  @override
  ResultFuture<void> call(String params) => _repo.forgotPassword(params);
}
