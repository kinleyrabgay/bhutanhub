import 'package:bhutanhub/core/usecase/usecase.dart';
import 'package:bhutanhub/core/utils/typedef.dart';
import 'package:bhutanhub/src/features/authentication/domain/repositories/authentication.dart';
import 'package:equatable/equatable.dart';

class Register extends UsecaseWithParam<void, RegisterParams> {
  const Register(this._repo);

  final AuthenticationRepository _repo;

  @override
  ResultFuture<void> call(RegisterParams params) => _repo.register(
        name: params.name,
        email: params.email,
        password: params.password,
      );
}

class RegisterParams extends Equatable {
  const RegisterParams({
    required this.name,
    required this.email,
    required this.password,
  });

  const RegisterParams.empty() : this(email: '', password: '', name: '');

  final String name;
  final String email;
  final String password;

  @override
  List<String> get props => [name, email, password];
}
