import 'package:bhutan_hub/core/usecase/usecase.dart';
import 'package:bhutan_hub/core/utils/typedef.dart';
import 'package:bhutan_hub/src/features/authentication/domain/repositories/authentication.dart';

class ForgotPassword extends UsecaseWithParam<void, String> {
  const ForgotPassword(this._repo);

  final AuthenticationRepository _repo;

  @override
  ResultFuture<void> call(String params) => _repo.forgotPassword(params);
}
