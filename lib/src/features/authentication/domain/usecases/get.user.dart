import 'package:bhutanhub/core/usecase/usecase.dart';
import 'package:bhutanhub/core/utils/typedef.dart';
import 'package:bhutanhub/src/features/authentication/domain/entities/user.dart';
import 'package:bhutanhub/src/features/authentication/domain/repositories/authentication.dart';

class GetUser extends UsecaseWithoutParam<UserEntity> {
  const GetUser(this._repository);
  final AuthenticationRepository _repository;

  @override
  ResultFuture<UserEntity> call() async => _repository.getUser();
}
