import 'package:bhutan_hub/core/usecase/usecase.dart';
import 'package:bhutan_hub/core/utils/typedef.dart';
import 'package:bhutan_hub/src/features/authentication/domain/repositories/authentication.dart';
import 'package:equatable/equatable.dart';

class Register extends UsecaseWithParam<void, RegisterParams> {
  const Register(this._repo);

  final AuthenticationRepository _repo;

  @override
  ResultFuture<void> call(RegisterParams params) => _repo.register(
        email: params.email,
        password: params.password,
      );
}

class RegisterParams extends Equatable {
  const RegisterParams({
    required this.email,
    required this.password,
  });

  const RegisterParams.empty() : this(email: '', password: '');

  final String email;
  final String password;

  @override
  List<String> get props => [email, password];
}
