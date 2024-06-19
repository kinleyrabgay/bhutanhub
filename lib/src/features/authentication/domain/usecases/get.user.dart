import 'package:bhutanhub/core/usecase/usecase.dart';
import 'package:bhutanhub/core/utils/typedef.dart';
import 'package:bhutanhub/src/features/authentication/domain/entities/user.dart';
import 'package:bhutanhub/src/features/authentication/domain/repositories/authentication.dart';

class GetUser extends UsecaseWithoutParam<User> {
  const GetUser(this._repository);
  final AuthenticationRepository _repository;

  @override
  ResultFuture<User> call() async => _repository.getUser();
}
